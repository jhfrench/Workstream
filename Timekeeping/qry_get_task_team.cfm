
<!--Timekeeping/qry_get_task_team.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_task_team" datasource="#application.datasources.main#">
SELECT Team.emp_id AS emp_id
FROM Team
WHERE Team.task_id=#attributes.task_id#
		AND Team.role_id=4
</cfquery>
</cfsilent>
