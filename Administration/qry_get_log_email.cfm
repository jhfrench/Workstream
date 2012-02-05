<!-- Administration/qry_get_log_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_log_email.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 6/15/11)
			Added ability to view emails sent through the application.
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
<cfquery name="get_log_email" datasource="#application.datasources.main#">
SELECT LOG_Email.email_id, LOG_Email.reply_to, LOG_Email.carbon_copy_to,
	LOG_Email.subject, LOG_Email.email_body, LOG_Email.created_date,
	Demographics.email_address, User_Account.user_name AS sender, Link_Email_Upload.upload_id,
	LOG_Upload.archived_file_name, LOG_Upload.original_file_name
FROM LOG_Email
	LEFT OUTER JOIN Link_Email_Demographics ON LOG_Email.email_id=Link_Email_Demographics.email_id
	LEFT OUTER JOIN Demographics ON Link_Email_Demographics.demographics_id=Demographics.demographics_id
	LEFT OUTER JOIN Link_Email_Upload ON LOG_Email.email_id=Link_Email_Upload.email_id
	LEFT OUTER JOIN LOG_Upload ON Link_Email_Upload.upload_id=LOG_Upload.upload_id
	LEFT OUTER JOIN User_Account ON ISNULL(LOG_Email.created_by,0)=User_Account.user_account_id<cfif isdefined("attributes.email_id")>
WHERE LOG_Email.email_id IN (#attributes.email_id#)</cfif>
ORDER BY LOG_Email.email_id, Demographics.email_address
</cfquery>