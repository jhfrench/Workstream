<!-- Help/qry_get_screen_help_search.cfm
	Author: Jeromy French -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_screen_help_search.cfm">
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

<cfquery name="get_screen_help_search" datasource="#application.datasources.main#">
SELECT Help_Article.help_article_id AS help_id, Help_Article.help_article_title AS help_title, Help_Article.help_article_text,
	Help_Article.created_date, Demographics.last_name + ', ' + Demographics.first_name AS article_author, SUBSTRING(Help_Article.help_article_text, 1, 50)+'...' AS help_text_short,
	1 AS main_sort_order, Help_Article.sort_order AS secondary_sort_order
FROM Help_Article
	INNER JOIN Demographics ON Help_Article.created_by=Demographics.user_account_id
WHERE Help_Article.active_ind=1
	AND Demographics.active_ind=1
	AND <cfif len(trim(attributes.search_string))>(<cfif attributes.case_sensitive_ind>
		Help_Article.help_article_title LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.search_string#%">
			OR Help_Article.help_article_text LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.search_string#%"><cfelse>
		UPPER(Help_Article.help_article_title) LIKE UPPER(<cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.search_string#%">)
			OR UPPER(Help_Article.help_article_text) LIKE UPPER(<cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.search_string#%">)</cfif>
	)<cfif application.use_help_faq_ind>
UNION ALL
SELECT Help_FAQ.help_faq_id, Help_FAQ.question, Help_FAQ.answer,
	Help_FAQ.created_date, Demographics.last_name + ', ' + Demographics.first_name AS response_author, SUBSTRING(Help_FAQ.answer, 1, 50)+'...' AS help_text_short,
	2 AS main_sort_order, Help_FAQ.sort_order AS secondary_sort_order
FROM Help_FAQ
	INNER JOIN Demographics ON Help_FAQ.answered_by=Demographics.user_account_id
WHERE Help_FAQ.active_ind=1
	AND Help_FAQ.public_ind=1/*only show articles that the answerer has deemed should be visible to all users (the public)*/
	AND Demographics.active_ind=1
	AND (<cfif attributes.case_sensitive_ind>
		Help_FAQ.question LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.search_string#%">
			OR Help_FAQ.answer LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.search_string#%"><cfelse>
		UPPER(Help_FAQ.question) LIKE UPPER(<cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.search_string#%">)
			OR UPPER(Help_FAQ.answer) LIKE UPPER(<cfqueryparam cfsqltype="cf_sql_varchar" value="%#attributes.search_string#%">)</cfif>
	)</cfif>
ORDER BY main_sort_order, help_title<cfelse>
	1=0 /*if the user submits the form without entering a search string*/</cfif>
</cfquery>
<cfset caller.get_screen_help_search=get_screen_help_search>
