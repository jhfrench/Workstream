
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
	||
 --->
<cfquery name="send_isay_link" datasource="#application.datasources.main#">
SELECT Task.name AS task_name, Email.email AS email_to
FROM Task, Team, Email
WHERE Task.task_id=Team.task_id
	AND Team.emp_id=Email.emp_id
	AND Team.role_id=1
	AND Email.email_type_id=1
	AND Task.task_id=#attributes.task_id#
</cfquery>
<cfmail query="send_isay_link" to="#email_to#" from="#application.erroremailfrom#" subject="Your recent IT Experience" type="html" server="#application.emailserver#">
<p>
In an effort to provide you with world class IT support, we request that you fill out the hyper-linked survey below. Your feedback will facilitate our quest for continual improvement and is a requirement of ISO 9000.  Thank you in advance for your efforts.			
<p>
Task Name: #task_name#
<p>
<a href="http://www.isaysurvey.com/rd.cfm?sid=350&e=1">Click here to complete the survey.</a>
<cfmailparam name="Reply-To" value="jeromy_french@hotmail.com">
</cfmail>
</cfsilent>

