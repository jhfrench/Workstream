
<!--Timekeeping/qry_update_task_team.cfm
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
<cfquery name="update_task_team" datasource="#application.datasources.main#">
DELETE
FROM Team
WHERE task_id=#attributes.task_id# AND roll_id=4
</cfquery>
<cfif listlen(attributes.task_team)>
<cfif listcontains(attributes.task_team, "|")>
	<cfset attributes.task_team = listdeleteat(attributes.task_team, "2", "|")>
</cfif>
<cfquery name="update_task_team" datasource="#application.datasources.main#">
<cfloop list="#attributes.task_team#" index="ii">
INSERT INTO Team(task_id,emp_id,roll_id)
VALUES (#attributes.task_id#,#ii#,4)
</cfloop>
</cfquery>
</cfif>
</cfsilent>

