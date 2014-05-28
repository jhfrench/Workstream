<!-- common_files/qry_get_screen_help_faqs.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_screen_help_faqs.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/25/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.help_faqs_lookup_type_id" default="2">
<cfparam name="attributes.public_ind" default="1">

<cfquery name="get_screen_help_faqs" datasource="#application.datasources.main#">
SELECT Help_FAQ.help_faq_id, Help_FAQ.question, Help_FAQ.answer,
	Help_FAQ.active_ind, Help_FAQ.sort_order, Help_FAQ.created_date
FROM Help_FAQ
	INNER JOIN Link_Screen_Help_FAQ ON Help_FAQ.help_faq_id=Link_Screen_Help_FAQ.help_faq_id
		AND Link_Screen_Help_FAQ.active_ind=1<cfif attributes.help_faqs_lookup_type_id EQ 1>
		AND Help_FAQ.help_faq_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.help_faq_id#"> /*specific help_article_faq*/<cfelse>
	INNER JOIN REF_Screen ON Link_Screen_Help_FAQ.screen_id=REF_Screen.screen_id
		AND REF_Screen.active_ind=1
		AND REF_Screen.fuseaction=<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.fuseaction#" /></cfif>
WHERE Help_FAQ.active_ind=1<cfif attributes.public_ind>
	AND Help_FAQ.public_ind=1/*only show articles that the answerer has deemed should be visible to all users (the public)*/</cfif>
ORDER BY Help_FAQ.sort_order<cfif attributes.help_faqs_lookup_type_id EQ 1>
LIMIT 1</cfif>
</cfquery>
<cfset caller.get_screen_help_faqs=get_screen_help_faqs>
