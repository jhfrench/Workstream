<!-- Administration/act_send_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_email.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/4/2009" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
<cfset variables.carbon_copy_to=listchangedelims(attributes.carbon_copy_to,","," ;")>
<!--- consolidate CC list with recipient list; do not send to emails listed in "Email_Blacklist" table --->
<cfinclude template="qry_get_email_recipients.cfm">

<cfif get_email_recipients.recordcount EQ 0>
	<cfoutput>Your message has no valid recipients, so it cannot be sent<cfif len(attributes.carbon_copy_to)>;<br /> the following recipient(s) have opted out of receiving Workstream emails:<br /> #variables.carbon_copy_to#</cfif>.</cfoutput>
<cfelse>
<cfset variables.created_by=variables.user_identification>
<!--- INSERT MESSAGE DETAILS INTO DATABASE: --->
	<!--- LOG_Email --->
	<cfinclude template="qry_insert_log_email.cfm">

	<cfif isdefined("attributes.email_recipients_demographics_id")>
		<!--- Link_Email_Demographics --->
		<cfinclude template="qry_insert_link_email_demographics.cfm">
	</cfif>

	<cfif len(attributes.upload_id)>
		<!--- Link_Email_Upload --->
		<cfinclude template="qry_insert_link_email_upload.cfm">
		<cfinclude template="qry_get_log_upload.cfm">
		<cfset variables.upload_directory_path="#GetDirectoryfromPath(GettemplatePath())#Uploaded_Files">
	</cfif>
<!--- SEND THE MESSAGE --->

<cfset variables.email_recipients=valuelist(get_email_recipients.email_address)>
<!--- $issue$: how is this different from common_files/act_send_prepared_email.cfm? --->
<cfmail from="#application.system_email_sender#" replyto="#attributes.reply_to#" to="#attributes.reply_to#" bcc="#variables.email_recipients#" failto="#attributes.reply_to#" subject="#attributes.subject#" type="HTML"
	server="#application.email_server_name#" username="#application.email_username#" password="#application.email_password#"
	port="#application.email_port#" usetls="#application.email_usetls#" usessl="#application.email_usessl#">
#attributes.email_body#

<cfif len(attributes.upload_id)>
	<cfloop query="get_log_upload">
		<cfmailparam file="#variables.upload_directory_path#/#archived_file_name#">
	</cfloop>
</cfif>

You have received this message because you are subscribed to one or more mailing lists with #application.product_name#. If you wish to no longer receive emails from this system, please use this link to opt-out: #listfirst(cgi.http_referer,"?")#?fuseaction=Administration.opt-out<cfif listlen(variables.email_recipients) EQ 1>&email_address=#variables.email_recipients#</cfif>
</cfmail>
Your message has been sent.
</cfif>