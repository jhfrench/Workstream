<!-- Administration/pag_display_help_article.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_display_help_article.cfm">
	<responsibilities>
		I show the Help_Article records associated with the fuseaction of the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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

<!--- show user specific help article they have requested --->
<cfif isdefined("attributes.help_article_id")>
<cfmodule template="../common_files/qry_get_screen_help_articles.cfm" show_all_help_articles_ind="0" help_article_id="#attributes.help_article_id#">
<table summary="Table displays help articles">
<cfoutput query="get_screen_help_articles">
	<tr>
		<td>
			#help_article_title#
		</td>
	</tr>
<!--- display records from query --->
	<tr>
		<td>
			Entered #dateformat(created_date,"dd-mmm-yyyy")# by #article_author#
		</td>
	</tr>
	<tr>
		<td>
			#help_article_text#
		</td>
	</tr>
</cfoutput>
</table>
</cfif>