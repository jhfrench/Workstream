<!-- Administration/qry_get_help_faq.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_help_faq.cfm">
	<responsibilities>
		Query to get system help faq.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.help_faq_id" default="0">
<cfquery name="get_help_faq" datasource="#application.datasources.main#">
SELECT Help_FAQ.help_faq_id, Help_FAQ.question, Help_FAQ.asked_by,
	Help_FAQ.email_requested_ind, COALESCE(Help_FAQ.asker_email_address, Demographics.email_address) AS asker_email_address, Help_FAQ.answer,
	Help_FAQ.public_ind, Help_FAQ.active_ind, Help_FAQ.sort_order,
	Demographics.first_name || ' ' || Demographics.last_name AS questioner, Link_Screen_Help_FAQ.screen_id
FROM Help_FAQ
	LEFT OUTER JOIN Link_Screen_Help_FAQ ON Help_FAQ.help_faq_id=Link_Screen_Help_FAQ.help_faq_id
		AND Link_Screen_Help_FAQ.active_ind=1
	LEFT OUTER JOIN Demographics ON Help_FAQ.asked_by=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Help_FAQ.help_faq_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.help_faq_id#" />
ORDER BY Help_FAQ.sort_order
</cfquery>