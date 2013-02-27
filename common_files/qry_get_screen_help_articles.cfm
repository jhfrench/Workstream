<!-- common_files/qry_get_screen_help_articles.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_screen_help_articles.cfm">
	<responsibilities>
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
<cfparam name="attributes.help_articles_lookup_type_id" default="2">
<cfquery name="get_screen_help_articles" datasource="#application.datasources.main#">
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------
SELECT Help_Article.help_article_id, Help_Article.help_article_text, Help_Article.help_article_title,
	Help_Article.active_ind, Help_Article.sort_order, Help_Article.created_date,
	REF_Module.description AS module, REF_Screen.fuseaction, REF_Business_Function.description AS business_function,
	REF_Business_Function.acronym, Link_Screen_Help_Article.l_s_h_a_id, Demographics.last_name || ', ' || Demographics.first_name AS article_author,
	SUBSTRING(Help_Article.help_article_text, 1, 50) || '...' AS help_article_text_short,
	CASE
		WHEN fuseaction=<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.fuseaction#" /> THEN 'screen-specific'
		WHEN fuseaction LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="#listfirst(attributes.fuseaction,".")#.%" /> THEN 'general&nbsp;module'
		ELSE 'All&nbsp;screens'
	END AS help_article_level
FROM Link_Screen_Help_Article
	INNER JOIN Help_Article ON Link_Screen_Help_Article.help_article_id=Help_Article.help_article_id
	INNER JOIN REF_Screen ON Link_Screen_Help_Article.screen_id=REF_Screen.screen_id
	INNER JOIN REF_Module ON REF_Screen.module_id=REF_Module.module_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	LEFT OUTER JOIN Demographics ON Help_Article.created_by=Demographics.user_account_id
		AND Demographics.active_ind=1
WHERE Link_Screen_Help_Article.active_ind=1
	AND Help_Article.active_ind=1
	AND REF_Screen.active_ind=1
	AND REF_Module.active_ind=1
	AND REF_Business_Function.active_ind=1
	AND 
	<cfswitch expression="#attributes.help_articles_lookup_type_id#">
		<cfcase value="1">
		/*specific help_article_article*/
		Help_Article.help_article_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.help_article_id#">
		</cfcase>
		<cfcase value="2">
		REF_Screen.fuseaction=<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.fuseaction#" />
		</cfcase>
		<cfcase value="3">
		/*list all help_article_article*/
		1=1
		</cfcase>
		<cfdefaultcase>throw_error=1</cfdefaultcase>
	</cfswitch>
ORDER BY REF_Module.sort_order, REF_Business_Function.sort_order, Help_Article.sort_order<cfif attributes.help_articles_lookup_type_id EQ 1>
LIMIT 1</cfif>
</cfquery>
<cfset caller.get_screen_help_articles=get_screen_help_articles>
