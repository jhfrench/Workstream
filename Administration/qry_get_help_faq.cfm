<!-- Administration/qry_get_help_faq.cfm
	Author: Jeromy French-->
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
	Help_FAQ.email_requested_ind, ISNULL(Help_FAQ.asker_email_address, Demographics.email_address) AS asker_email_address, Help_FAQ.answer,
	Help_FAQ.public_ind, Help_FAQ.active_ind, Help_FAQ.sort_order,
	Demographics.first_name + ' ' + Demographics.last_name AS questioner, Link_Screen_Help_FAQ.screen_id
FROM Help_FAQ
	LEFT OUTER JOIN Link_Screen_Help_FAQ ON Help_FAQ.help_faq_id=Link_Screen_Help_FAQ.help_faq_id
		AND Link_Screen_Help_FAQ.active_ind=1
	LEFT OUTER JOIN Demographics ON Help_FAQ.asked_by=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Help_FAQ.help_faq_id=#attributes.help_faq_id#
ORDER BY Help_FAQ.sort_order
</cfquery>
<cfif get_help_faq.recordcount>
	<cfset attributes.screen_id=valuelist(get_help_faq.screen_id)>
	<cfset attributes.question=get_help_faq.question>
	<cfset attributes.asked_by=get_help_faq.asked_by>
	<cfset attributes.email_requested_ind=get_help_faq.email_requested_ind>
	<cfset attributes.asker_email_address=get_help_faq.asker_email_address>
	<cfset attributes.answer=get_help_faq.answer>
	<cfset attributes.public_ind=get_help_faq.public_ind>
	<cfset attributes.active_ind=get_help_faq.active_ind>
	<cfset attributes.sort_order=get_help_faq.sort_order>
	<cfset attributes.questioner=get_help_faq.questioner>
</cfif>