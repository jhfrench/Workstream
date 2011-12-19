
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
Revision 1.1  2005/03/09 18:28:16  stetzer
<>

Revision 1.3  2001-10-11 17:32:33-04  french
Corrected grammar of original comment. This comment can be deleted at will.

Revision 1.2  2001-10-11 15:36:29-04  long
Added code <cfset attributes.task_team = ListDeleteAt(attributes.task_team, "2", "|")>"  to handle the situation where a person clicks "all" on the team select choice.

Revision 1.1  2001-10-11 10:54:31-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
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
	<cfset attributes.task_team = ListDeleteAt(attributes.task_team, "2", "|")>
</cfif>
<cfquery name="update_task_team" datasource="#application.datasources.main#">
<cfloop list="#attributes.task_team#" index="ii">
INSERT INTO Team(task_id,emp_id,roll_id)
VALUES (#attributes.task_id#,#ii#,4)
</cfloop>
</cfquery>
</cfif>
</cfsilent>

