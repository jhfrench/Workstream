
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
DELETE FROM Team
WHERE task_id=#attributes.task_id#
	AND role_id=4
</cfquery>
<cfif listlen(attributes.task_team)>
	<cfif listlen(attributes.task_team, "|")>
		<cfset attributes.task_team=listdeleteat(attributes.task_team, "2", "|")><!--- $issue$: can this be separated out into two different parameters? --->
	</cfif>
	<cfquery name="update_task_team" datasource="#application.datasources.main#">
	INSERT INTO Team(task_id, emp_id, role_id)
	SELECT #attributes.task_id#, emp_id, 4
	FROM Emp_Contact
	WHERE emp_id IN (#attributes.task_team#)
	</cfquery>
</cfif>
</cfsilent>