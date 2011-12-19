<!-- Help/dsp_view_help_article.cfm
	Author: Jeromy French-->
<!--- 
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_help_article.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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
<cfsetting showdebugoutput="no">
<cfset attributes.help_articles_lookup_type_id=1>
<cfinclude template="../common_files/qry_get_screen_help_articles.cfm">

<cfoutput>
<table cols="1" summary="Table displays help articles">
	<tr>
		<td>
			#get_screen_help_articles.help_article_text#
		</td>
	<tr>
</table>
</cfoutput>