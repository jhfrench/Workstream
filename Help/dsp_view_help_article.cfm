<!-- Help/dsp_view_help_article.cfm
	Author: Jeromy French -->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_help_article.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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
<cfsetting showdebugoutput="yes">
<cfset attributes.help_articles_lookup_type_id=1>
<cfinclude template="../common_files/qry_get_screen_help_articles.cfm">
<dl>
<cfoutput query="get_screen_help_articles">
	<dt>#help_article_title#</dt>
	<dd>#help_article_text#</dd>
</cfoutput>
</dl>