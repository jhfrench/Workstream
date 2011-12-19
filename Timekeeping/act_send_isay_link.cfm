
<!--Timekeeping/act_send_isay_link.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I reassign hours.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:20:16  stetzer
<>

Revision 1.2  2002-04-11 16:26:19-04  lee
changed email from address and added reply-to param

Revision 1.1  2001-10-11 10:55:17-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
 --->
<cfquery name="send_isay_link" datasource="#application.datasources.main#">
SELECT Task.name AS task_name, Email.email AS email_to
FROM Task, Team, Email
WHERE Task.task_id=Team.task_id
	AND Team.emp_id=Email.emp_id
	AND Team.roll_id=1
	AND Email.email_type_id=1
	AND Task.task_id=#attributes.task_id#
</cfquery>
<cfmail query="send_isay_link" to="#email_to#" from="#application.erroremailfrom#" subject="Your recent Nucleus IT Experience" type="html" server="#application.emailserver#">
<p>
In an effort to provide you with world class IT support, we request that you fill out the hyper-linked survey below. Your feedback will facilitate our quest for continual improvement and is a requirement of ISO 9000.  Thank you in advance for your efforts.			
<p>
Task Name: #task_name#
<p>
<a href="http://www.isaysurvey.com/rd.cfm?sid=350&e=1">Click here to complete the survey.</a>
<cfmailparam name="Reply-To" value="evans@nucleusweb.com">
</cfmail>
</cfsilent>

