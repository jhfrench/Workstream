
<!--Timekeeping/qry_get_team_members.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the team members for a given task. Currently used by Timekeeping/dsp_project_timeline_details.cfm.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	(9/11/12 | JF) This template is used by Timekeeping/dsp_project_timeline_details.cfm.
	 || 
	END FUSEDOC --->
<cfquery name="get_team_members" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname, Emp_Contact.emp_id
FROM Team
	INNER JOIN Emp_Contact ON Team.user_account_id=Emp_Contact.emp_id
WHERE Team.active_ind=1
	AND Team.task_id=#task_id#
GROUP BY Emp_Contact.lname, Emp_Contact.emp_id
ORDER BY Emp_Contact.lname, Emp_Contact.emp_id
</cfquery>
</cfsilent>