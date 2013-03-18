
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
FROM Task
	INNER JOIN Team ON Task.task_id=Team.task_id
		AND Team.active_ind=1
		AND Team.role_id=1
	INNER JOIN Email ON Team.user_account_id=Email.user_account_id
		AND Email.active_ind=1
		AND Email.email_type_id=1
WHERE Task.task_id=#attributes.task_id#
</cfquery>
<!--- $issue$: does this get used from anywhere? --->
<!--- $issue$: need to give recipient of this message an "out" so they can stop receiving these notifications --->
<cfmail query="send_isay_link" to="#email_to#" from="#application.application_specific_settings.system_email_sender#" subject="Your recent IT Experience" type="html" type="HTML"
		server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
		port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
<p>
In an effort to provide you with world class IT support, we request that you fill out the hyper-linked survey below. Your feedback will facilitate our quest for continual improvement and is a requirement of ISO 9000.  Thank you in advance for your efforts.
<p>
Task Name: #task_name#
<p>
<a href="http://www.isaysurvey.com/rd.cfm?sid=350&e=1">Click here to complete the survey.</a>
<cfmailparam name="Reply-To" value="jeromy_french@hotmail.com"><!--- $issue$: need to change this to a different value --->
</cfmail>
</cfsilent>