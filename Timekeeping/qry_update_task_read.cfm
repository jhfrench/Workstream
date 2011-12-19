
<!--Timekeeping/qry_update_task_read.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task to show that the task has been read.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:28:07  stetzer
<>

Revision 1.1  2001-10-11 10:54:33-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfquery name="update_task_read" datasource="#application.datasources.main#">
UPDATE Task
SET task_read=1
WHERE task_id=#attributes.task_id#
</cfquery>
</cfsilent>

