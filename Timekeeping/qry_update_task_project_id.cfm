
<!--Timekeeping/qry_update_task_project_id.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task owner.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_project_id" datasource="#application.datasources.main#">
UPDATE Task
SET project_id=#attributes.project_id#
WHERE task_id=#attributes.task_id#

UPDATE Time_Entry
SET project_id=#attributes.project_id#
WHERE task_id=#attributes.task_id#
	AND Time_Entry.date > (SELECT MAX(Date_Locked.date_locked) AS date_locked
							FROM Emp_Contact, Link_Emp_Contact_Employer, Date_Locked, Demographics_Ngauge AS Demographics
							WHERE Emp_Contact.emp_id=#session.user_account_id# 
								AND (Demographics.effective_to IS NULL OR Demographics.effective_to > GETDATE())
								AND (Demographics.effective_from IS NULL OR Demographics.effective_from < GETDATE())
								AND Emp_Contact.emp_id=Link_Emp_Contact_Employer.emp_id
								AND Link_Emp_Contact_Employer.company_id=Date_Locked.company_id
								AND Emp_Contact.emp_id=Demographics.emp_id)
</cfquery>
</cfsilent>

