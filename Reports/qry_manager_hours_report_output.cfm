
<!-- Reports/qry_manager_hours_report_output.cfm
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
SELECT Employee_Data.employee_classification, Employee_Data.user_account_id, Employee_Data.name,
	Employee_Data.lname, Time_Entry_Data.work_date, Time_Entry_Data.display,
	COALESCE(Time_Entry_Data.hours,0) AS hours, Employee_Data.company, Employee_Data.user_account_id,
	COALESCE(Notes.note,'') AS note
FROM (
		SELECT Demographics.user_account_id, Demographics.first_name AS name, Demographics.last_name AS lname,
			MAX(COALESCE(REF_Employee_Classification.employee_classification, 'None')) AS employee_classification, REF_Company.description AS company
		FROM Demographics
			INNER JOIN View_Demographics_Workstream ON Demographics.user_account_id=View_Demographics_Workstream.user_account_id
				AND COALESCE(View_Demographics_Workstream.effective_to, #variables.from_date#) >= #variables.from_date#
				AND COALESCE(View_Demographics_Workstream.hire_date, #variables.through_date#) <= #variables.through_date#
			INNER JOIN REF_Employee_Classification ON REF_Employee_Classification.employee_classification_id=COALESCE(View_Demographics_Workstream.employee_classification_id,7)
			INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
				AND Link_Company_User_Account.active_ind=1
			INNER JOIN REF_Company ON Link_Company_User_Account.company_id=REF_Company.company_id 
		WHERE Demographics.active_ind=1
			AND Demographics.user_account_id IN (#attributes.included_user_account_id#)
		GROUP BY Demographics.user_account_id, Demographics.first_name, Demographics.last_name,
			REF_Company.description
	) AS Employee_Data 
	LEFT OUTER JOIN (
		SELECT Time_Entry.user_account_id, Time_Entry.work_date, Time_Entry.hours, Time_Entry.notes_id, 
			<cfif isdefined("session.workstream_project_list_order") AND session.workstream_project_list_order EQ 2>(Project.project_code || '-' || Project.description)<cfelse>(Project.description || ' (' ||  Project.project_code || ')')</cfif> AS display
		FROM Time_Entry
			INNER JOIN Project ON Time_Entry.project_id=Project.project_id
		WHERE Time_Entry.active_ind=1
			AND Time_Entry.work_date BETWEEN #variables.from_date# AND #variables.through_date# 
			AND Time_Entry.user_account_id IN (#attributes.included_user_account_id#) 
		) AS Time_Entry_Data ON Employee_Data.user_account_id=Time_Entry_Data.user_account_id
	LEFT OUTER JOIN Notes ON Time_Entry_Data.notes_id=Notes.notes_id
		AND Notes.active_ind=1
ORDER BY Employee_Data.lname, Employee_Data.name, Employee_Data.employee_classification,
	Time_Entry_Data.work_date
</cfquery>
</cfsilent>