
<!--Timekeeping/qry_update_task_priority.cfm
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
Revision 1.1  2005/03/09 18:28:00  stetzer
<>

Revision 1.1  2001-10-11 10:54:34-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="update_task_priority" datasource="#application.datasources.main#">
UPDATE Task
SET priority_id=#attributes.priority_id#
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

