<!-- Administration/dsp_view_help_article.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_view_help_article.cfm">
	<responsibilities>
		I display the help article records associated with the fuseaction of the page the user is viewing.
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

<cfset attributes.show_all_help_articles_ind=0>
<cfinclude template="../common_files/qry_get_screen_help_articles.cfm">
<cfoutput>
<table summary="Table displays help article">
	<tr>
		<td>
			#get_screen_help_articles.help_article_text#
		</td>
	<tr>
</table>
</cfoutput>