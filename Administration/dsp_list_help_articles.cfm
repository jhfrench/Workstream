<!-- Administration/dsp_list_help_articles.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_list_help_articles.cfm">
	<responsibilities>
		Page displays a list of help articles.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/21/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Cleaning up verbiage and row coloring.
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
<h2>Administer Help Articles</h2>
<a href="javascript:edit_listed_help_article(0);" class="btn">Add new help article</a>
<table cols="3" summary="Table displays help articles that can be edited" class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Title</th>
			<th>Author</th>
			<th>Sort Order</th>
		</tr>
	<thead>
	<tbody>
		<cfoutput query="get_all_help_articles">
		<tr>
			<th scope="row"><a href="javascript:edit_listed_help_article(#help_article_id#);" title="Edit this aticle">#help_article_title#</a></th>
			<td>#first_name# #last_name#</td>
			<td class="number">#sort_order#</td>
		</tr>
		</cfoutput>
	</tbody>
</table>
