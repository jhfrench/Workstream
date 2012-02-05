<!-- Administration/qry_get_all_help_articles.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_all_help_articles.cfm">
	<responsibilities>
		Query to retreive all system help articles.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/17/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_all_help_articles" datasource="#application.datasources.main#">
SELECT Help_Article.help_article_id, Help_Article.help_article_title AS help_article_title, Help_Article.help_article_text,
	LEN(Help_Article.help_article_text) AS article_length, Help_Article.sort_order AS sort_order, Help_Article.active_ind,
	Demographics.last_name, Demographics.first_name
FROM Help_Article
	INNER JOIN Demographics ON Help_Article.created_by=Demographics.user_account_id
WHERE Help_Article.active_ind=1
	AND Demographics.active_ind=1
ORDER BY Help_Article.sort_order, Help_Article.help_article_title
</cfquery>
<cfset caller.get_all_help_articles=get_all_help_articles>