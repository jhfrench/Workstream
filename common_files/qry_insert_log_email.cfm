<!-- common_files/qry_insert_log_email.cfm
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
VALUES ('#xmlformat(attributes.reply_to)#', '#variables.carbon_copy_to#', '<cfif len(attributes.subject)>#attributes.subject#<cfelse>UNSPECIFIED</cfif>',
	<cfqueryparam cfsqltype="cf_sql_clob" value="#variables.email_body#" />, #variables.created_by#)
</cfquery>