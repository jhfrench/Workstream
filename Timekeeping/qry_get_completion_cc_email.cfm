
<!--Timekeeping/qry_get_completion_cc_email.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the emp_id of the people who are to receive email reminders of a task's due_date.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:23:45  stetzer
<>

Revision 1.1  2001-10-11 10:54:49-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> attributes.task_id: list that contains task id's submitted fromthe express timekeeping page
	<-- email_id: list that contains the emp_id's of everyone who is supposed to be CC'd on the email
 --->
<cfquery name="get_completion_cc_email" datasource="#application.datasources.main#">
SELECT Email.emp_id as email_id
FROM Notification, Email
WHERE Notification.email_id=Email.email_id
	AND task_id=#attributes.task_id#
	AND notification_type=6
</cfquery>
</cfsilent>

