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
SELECT Help_Article.help_article_id, Help_Article.help_article_text, Help_Article.help_article_title
FROM Help_Article
	INNER JOIN Link_Screen_Help_Article ON Help_Article.help_article_id=Link_Screen_Help_Article.help_article_id
		AND Link_Screen_Help_Article.active_ind=1<cfif attributes.help_articles_lookup_type_id EQ 1>
		/*specific help_article_article*/
		AND Help_Article.help_article_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.help_article_id#"><cfelse>
	INNER JOIN REF_Screen ON Link_Screen_Help_Article.screen_id=REF_Screen.screen_id
		AND REF_Screen.active_ind=1
		AND REF_Screen.fuseaction=<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.fuseaction#" /></cfif>
WHERE Help_Article.active_ind=1
ORDER BY Help_Article.sort_order<cfif attributes.help_articles_lookup_type_id EQ 1>
LIMIT 1</cfif>
</cfquery>
<cfset caller.get_screen_help_articles=get_screen_help_articles>