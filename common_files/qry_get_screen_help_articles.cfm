<!-- common_files/qry_get_screen_help_articles.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_screen_help_articles.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="session.hide_general_help_articles" default="0">
<cfparam name="session.hide_module_all" default="0">
<cfparam name="attributes.help_articles_lookup_type_id" default="2">
<cfquery name="get_screen_help_articles" datasource="#application.datasources.main#">
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT Help_Article.help_article_id, Help_Article.help_article_text, Help_Article.help_article_title AS help_article_title,
	Help_Article.active_ind, Help_Article.sort_order, Help_Article.created_date,
	REF_Module.description AS module, REF_Screen.fuseaction, REF_Business_Function.description AS business_function,
	REF_Business_Function.acronym, Link_Screen_Help_Article.l_s_h_a_id, Demographics.last_name + ', ' + Demographics.first_name AS article_author,
	SUBSTRING(Help_Article.help_article_text, 1, 50)+'...' AS help_article_text_short,
	CASE
		WHEN fuseaction='#attributes.fuseaction#' THEN 'screen-specific'
		WHEN fuseaction LIKE '#listfirst(attributes.fuseaction,".")#.%' THEN 'general&nbsp;module'
		ELSE 'All&nbsp;screens'
	END AS help_article_level
FROM Link_Screen_Help_Article
	INNER JOIN Help_Article ON Link_Screen_Help_Article.help_article_id=Help_Article.help_article_id
	INNER JOIN REF_Screen ON Link_Screen_Help_Article.screen_id=REF_Screen.screen_id
	INNER JOIN REF_Module ON REF_Screen.module_id=REF_Module.module_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	INNER JOIN Demographics ON Help_Article.created_by=Demographics.user_account_id
WHERE Link_Screen_Help_Article.active_ind=1
	AND Help_Article.active_ind=1
	AND REF_Screen.active_ind=1
	AND REF_Module.active_ind=1
	AND REF_Business_Function.active_ind=1
	AND Demographics.active_ind=1
	AND 
	<cfswitch expression="#attributes.help_articles_lookup_type_id#">
		<cfcase value="1">
		/*specific help_article_article*/
		Help_Article.help_article_id=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#attributes.help_article_id#">
		</cfcase>
		<cfcase value="2">
		(1=0 /*this is here just for SQL syntax purposes*/<cfif NOT session.hide_general_help_articles>
		/*get article articles that apply to all screens, regardless of module*/
		OR REF_Screen.fuseaction LIKE 'All.%'</cfif><cfif NOT session.hide_module_all>
		/*get article articles that apply to all screens for a specific module*/
		OR REF_Screen.fuseaction='#listfirst(attributes.fuseaction,".")#.all'</cfif>
		/*get article articles that apply to the specifc screen*/
		OR REF_Screen.fuseaction='#attributes.fuseaction#')
		</cfcase>
		<cfcase value="3">
		/*list all help_article_article*/
		1=1</cfcase>
		<cfdefaultcase>throw_error=1</cfdefaultcase>
	</cfswitch>
ORDER BY REF_Module.sort_order, REF_Business_Function.sort_order, Help_Article.sort_order
</cfquery>
<cfset caller.get_screen_help_articles=get_screen_help_articles>
