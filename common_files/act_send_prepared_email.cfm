<!-- common_files/act_send_prepared_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_send_prepared_email.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/6/2011" role="FuseCoder" comments="Created File">
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
<cfmail from="#application.application_specific_settings.system_email_sender#" replyto="#attributes.reply_to#" to="#attributes.reply_to#" bcc="#variables.email_recipients#" failto="#attributes.reply_to#" subject="#attributes.subject#" server="#application.email_server_name#" type="text">
#attributes.email_body#

<cfif len(attributes.upload_id)>
	<cfloop query="get_log_upload">
		<cfmailparam file="#variables.upload_directory_path#/#archived_file_name#">
	</cfloop>
</cfif>

You have received this message because you are subscribed to one or more mailing lists with the NASA Vendor Database. If you wish to no longer receive emails from this system, please use this link to opt-out: #replace(listfirst(cgi.http_referer,"?"), "/nvdb.", "/vendors.nvdb.")#?fuseaction=Administration.opt-out<cfif listlen(variables.email_recipients) EQ 1>&email_address=#variables.email_recipients#</cfif>
</cfmail>