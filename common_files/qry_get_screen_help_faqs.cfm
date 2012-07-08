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

<cfparam name="session.hide_general_help_faqs" default="0">
<cfparam name="session.hide_module_all" default="0">
<cfparam name="attributes.help_faqs_lookup_type_id" default="2">
<cfparam name="attributes.public_ind" default="1">

<cfquery name="get_screen_help_faqs" datasource="#application.datasources.main#">
SELECT Help_FAQ.help_faq_id, Help_FAQ.question, Help_FAQ.answer,
	Help_FAQ.active_ind, Help_FAQ.sort_order, Help_FAQ.created_date,
	REF_Module.description AS module, REF_Screen.fuseaction, REF_Business_Function.description AS business_function,
	REF_Business_Function.acronym, Link_Screen_Help_FAQ.l_s_h_f_id, Demographics.last_name + ', ' + Demographics.first_name AS response_author,
	SUBSTRING(Help_FAQ.answer, 1, 50)+'...' AS help_faq_text_short
FROM Link_Screen_Help_FAQ
	INNER JOIN Help_FAQ ON Link_Screen_Help_FAQ.help_faq_id=Help_FAQ.help_faq_id
	INNER JOIN REF_Screen ON Link_Screen_Help_FAQ.screen_id=REF_Screen.screen_id
	INNER JOIN REF_Module ON REF_Screen.module_id=REF_Module.module_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	INNER JOIN Demographics ON Help_FAQ.answered_by=Demographics.user_account_id
WHERE Link_Screen_Help_FAQ.active_ind=1
	AND Help_FAQ.active_ind=1<cfif attributes.public_ind>
	AND Help_FAQ.public_ind=1/*only show articles that the answerer has deemed should be visible to all users (the public)*/</cfif>
	AND REF_Screen.active_ind=1
	AND REF_Module.active_ind=1
	AND REF_Business_Function.active_ind=1
	AND Demographics.active_ind=1
	AND
	<cfswitch expression="#attributes.help_faqs_lookup_type_id#">
		<cfcase value="1">
		/*specific help_article_faq*/
		Help_FAQ.help_faq_id=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#attributes.help_faq_id#">
		<cfif attributes.help_faqs_lookup_type_id EQ 1>AND rownum=1</cfif>
		</cfcase>
		<cfcase value="2">
		(1=0 /*this is here just for SQL syntax purposes*/<cfif NOT session.hide_general_help_faqs>
		/*get faq articles that apply to all screens, regardless of module*/
		OR fuseaction LIKE 'All.%'</cfif><cfif NOT session.hide_module_all>
		/*get faq articles that apply to all screens for a specific module*/
		OR fuseaction='#listfirst(attributes.fuseaction,".")#.all'</cfif>
		/*get faq articles that apply to the specifc screen*/
		OR fuseaction='#attributes.fuseaction#')
		</cfcase>
		<cfcase value="3">
		/*list all help_article_faq*/
		1=1</cfcase>
		<cfdefaultcase>throw_error=1</cfdefaultcase>
	</cfswitch>
ORDER BY REF_Module.sort_order, REF_Business_Function.sort_order, Help_FAQ.sort_order
</cfquery>
<cfset caller.get_screen_help_faqs=get_screen_help_faqs>
