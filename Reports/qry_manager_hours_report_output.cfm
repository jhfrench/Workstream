
<!-- reports/qry_manager_hours_report_output.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query out the manager's hours report information

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="manager_hours_report_output" datasource="#application.datasources.main#">
SELECT Employee_Data.employee_classification, Employee_Data.emp_id, Employee_Data.name,
	Employee_Data.lname, Time_Entry_Data.date, Time_Entry_Data.display,
	COALESCE(Time_Entry_Data.hours,0) AS hours, Employee_Data.company, Employee_Data.emp_id AS pin,
	COALESCE(Notes.note,'') AS note
FROM (
	SELECT Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname,
		MAX(COALESCE(REF_Employee_Classification.employee_classification, 'None')) AS employee_classification, REF_Company.description AS company
	FROM Emp_contact, Demographics, REF_Employee_Classification,
		Link_Company_Emp_Contact, REF_Company
	WHERE Emp_Contact.emp_id=Demographics.emp_id
		AND Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id 
		AND Link_Company_Emp_Contact.company_id=REF_Company.company_id 
		AND REF_Employee_Classification.employee_classification_id =COALESCE(Demographics.employee_classification_id,7) 
		AND COALESCE(Demographics.effective_to,#variables.from_date#) >= #variables.from_date#
		AND COALESCE(Demographics.effective_from,#variables.through_date#) <= #variables.through_date#
		AND Emp_Contact.emp_id IN (#attributes.included_emp_id#)
	GROUP BY Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname, REF_Company.description
	) AS Employee_Data 
	LEFT OUTER JOIN (
		SELECT Time_Entry.emp_id, Time_Entry.work_date, Time_Entry.hours, Time_Entry.notes_id, 
			<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>(Project.project_code || '-' || Project.description)<cfelse>(Project.description || ' (' ||  Project.project_code || ')')</cfif> AS display
		FROM Time_Entry
			INNER JOIN Project ON Time_Entry.project_id=Project.project_id
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.work_date BETWEEN #variables.from_date# AND #variables.through_date# 
			AND Time_Entry.emp_id IN (#attributes.included_emp_id#) 
		) AS Time_Entry_Data ON Employee_Data.emp_id=Time_Entry_Data.emp_id
	LEFT OUTER JOIN Notes ON Time_Entry_Data.notes_id=Notes.notes_id
		AND Notes.active_ind=1
ORDER BY Employee_Data.lname, Employee_Data.name, Employee_Data.employee_classification,
	Time_Entry_Data.date
</cfquery>
</cfsilent>