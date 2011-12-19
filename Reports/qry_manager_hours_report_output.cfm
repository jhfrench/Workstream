
<!-- reports/qry_manager_hours_report_output.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query out the manager's hours report information

	||
	Edits: 
	$Log$
	Revision 1.2  2006-10-20 13:14:11-05  french
	Task 48717: Previous code used to double results whenever an employee would have two or more Demographics records within the specified timeframe.

	Revision 1.1  2002-03-07 10:23:45-05  long
	added the ORDER BY statement

	Revision 1.0  2002-03-07 08:28:33-05  long
	created file to replace 3 other qry files
	||
	Variables:
	
	END FUSEDOC --->
<cfquery name="manager_hours_report_output" datasource="#application.datasources.main#">
SELECT Employee_Data.employee_classification, Employee_Data.emp_id, Employee_Data.name,
	Employee_Data.lname, Time_Entry_Data.date, Time_Entry_Data.display,
	ISNULL(Time_Entry_Data.hours,0) AS hours, Employee_Data.company, Employee_Data.emp_id AS pin,
	ISNULL(Notes.note,'') AS note
FROM (
	SELECT Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname,
		MAX(ISNULL(REF_Employee_Classification.employee_classification, 'None')) AS employee_classification, REF_Companies.company
	FROM Emp_contact, Demographics, REF_Employee_Classification,
		Company, REF_Companies
	WHERE Emp_Contact.emp_id=Demographics.emp_id
		AND Emp_Contact.emp_id=Company.emp_id 
		AND Company.company=REF_Companies.company_id 
		AND REF_Employee_Classification.employee_classification_id =ISNULL(Demographics.employee_classification_id,7) 
		AND ISNULL(Demographics.effective_to,#variables.from_date#) >= #variables.from_date#
		AND ISNULL(Demographics.effective_from,#variables.through_date#) <= #variables.through_date#
		AND Emp_Contact.emp_id IN (#attributes.included_emp_id#)
	GROUP BY Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname, REF_Companies.company
	) AS Employee_Data 
	LEFT OUTER JOIN (
		SELECT Time_Entry.emp_id, Time_Entry.date, Time_Entry.hours, Time_Entry.notes_id, 
			<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>(Project.project_code + ' - ' + Project.description)<cfelse>(Project.description + ' (' + Project.project_code + ')')</cfif> AS display
		FROM Time_Entry
			INNER JOIN Project ON Time_Entry.project_id=Project.project_id
		WHERE Time_Entry.date BETWEEN #variables.from_date# AND #variables.through_date# 
			AND Time_Entry.emp_id IN (#attributes.included_emp_id#) 
		) AS Time_Entry_Data ON Employee_Data.emp_id=Time_Entry_Data.emp_id
	LEFT OUTER JOIN Notes ON Time_Entry_Data.notes_id=Notes.notes_id
ORDER BY Employee_Data.lname, Employee_Data.name, Employee_Data.employee_classification,
	Time_Entry_Data.date
</cfquery>
</cfsilent>

<!--- OLD METHOD
SELECT ISNULL(REF_Employee_Classification.employee_classification, 'None') AS employee_classification, 
	Emp_Contact.emp_id, Emp_Contact.name, Emp_Contact.lname, 
	Time_Entry.date,
	<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>(Project.project_code + ' - ' + Project.description)<cfelse>(Project.description + ' (' + Project.project_code + ')')</cfif> AS display, 
	Notes.note,
	ISNULL(Time_Entry.Hours,0) AS hours, REF_Companies.company,
	Emp_Contact.emp_id AS pin
FROM Security INNER JOIN Emp_contact
		ON Emp_Contact.emp_id = Security.emp_id
	INNER JOIN Demographics
		ON Demographics.emp_id = Emp_Contact.emp_id 
	INNER JOIN Company
		ON Emp_Contact.emp_id = Company.emp_id 
	INNER JOIN REF_Companies
		ON Company.company = REF_Companies.company_id 
	LEFT OUTER JOIN Time_Entry
		ON Time_Entry.emp_id = Emp_Contact.emp_id 
		AND Time_Entry.date BETWEEN #variables.from_date# AND #variables.through_date#
		AND Time_Entry.date BETWEEN effective_from AND ISNULL(effective_to, Time_Entry.date)
	LEFT OUTER JOIN Project
		ON Time_Entry.project_id = Project.project_id 
	LEFT OUTER JOIN Notes
		ON Time_Entry.notes_id = Notes.notes_id 
	LEFT OUTER JOIN REF_Employee_Classification 
		ON REF_Employee_Classification.employee_classification_id = Demographics.employee_classification_id
WHERE Emp_Contact.emp_id IN (#attributes.included_emp_id#)
	AND Demographics.effective_from <= #variables.through_date#
	AND ISNULL(Demographics.effective_to,#variables.from_date#) >= #variables.from_date#
ORDER BY Emp_Contact.Lname, Emp_Contact.name, ISNULL(REF_Employee_Classification.employee_classification, 'None'), Time_Entry.date
 --->
