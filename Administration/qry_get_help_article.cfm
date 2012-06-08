<!-- Administration/qry_get_help_article.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_help_article.cfm">
	<responsibilities>
		Query to get system help article.
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

<cfparam name="attributes.help_article_id" default="0">
<cfquery name="get_help_article" datasource="#application.datasources.main#">
SELECT Help_Article.help_article_id, Help_Article.help_article_text, SUBSTRING(Help_Article.help_article_text, 1, 50)+'...' AS help_article_text_short,
	Help_Article.help_article_title, Help_Article.active_ind, Help_Article.sort_order,
	Link_Screen_Help_Article.screen_id
FROM Link_Screen_Help_Article
	INNER JOIN Help_Article ON Link_Screen_Help_Article.help_article_id=Help_Article.help_article_id
WHERE Help_Article.help_article_id=#attributes.help_article_id#
ORDER BY Help_Article.sort_order
</cfquery>
<cfset attributes.screen_id_selected=valuelist(get_help_article.screen_id)>