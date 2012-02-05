<!-- Administration/qry_insert_log_email.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_log_email.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
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
<cfquery name="insert_log_email" datasource="#application.datasources.main#">
INSERT INTO LOG_Email (reply_to, carbon_copy_to, subject,
	email_body, created_by)
VALUES ('#attributes.reply_to#', '#variables.carbon_copy_to#', '#attributes.subject#',
	'#attributes.email_body#', #variables.created_by#)
</cfquery>
<cfquery name="get_email_id" datasource="#application.datasources.main#">
SELECT IDENT_CURRENT('LOG_Email') AS email_id
</cfquery>
<cfset attributes.email_id=get_email_id.email_id>