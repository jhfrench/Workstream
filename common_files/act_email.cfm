
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
<cfparam name="attributes.email_type" default="HTML">
<cfparam name="attributes.email_body" default="">
</cfsilent>
<!--- $issue$: need to give recipient of this message an "out" so they can stop receiving these notifications --->
<cfmail subject="#attributes.email_subject#" to="#attributes.email_to#" from="#application.system_email_sender#" type="#attributes.email_type#"
	server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
	port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
	<cfmailparam name="Reply-To" value="#attributes.email_from#">
	#attributes.email_body#
</cfmail>