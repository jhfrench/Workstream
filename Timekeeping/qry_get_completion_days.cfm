
<!--Timekeeping/qry_get_completion_days.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the task icon.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:23:47  stetzer
<>

Revision 1.1  2001-10-11 10:54:49-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
 --->
<cfquery name="get_completion_days" datasource="#application.datasources.main#">
SELECT days_before_due AS reminder_days
FROM Notification
WHERE task_id=#attributes.task_id# AND notification_type=1
</cfquery>
</cfsilent>

