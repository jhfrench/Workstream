
<!--common_files/act_email.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I send emails based on user input.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfparam name="attributes.email_subject" default="">
<cfparam name="attributes.email_to" default="">
<cfparam name="attributes.email_from" default="">
<cfparam name="attributes.email_type" default="">
<cfparam name="attributes.email_body" default="">
</cfsilent>
<cfmail subject="#attributes.email_subject#" to="#attributes.email_to#" from="#application.erroremailfrom#" server="#application.emailserver#" type="#attributes.email_type#">
<cfmailparam name="Reply-To" value="#attributes.email_from#">
#attributes.email_body#<cfif isdefined("attributes.task_id")>

<a href="http://#cgi.server_name#/index.cfm?fuseaction=Timekeeping.task_details&task_id=#attributes.task_id#">Use this link to view the task.</a>
</cfif>
</cfmail>

