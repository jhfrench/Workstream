<!-- Requirements/dsp_screen_comments.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_screen_comments.cfm">
	<responsibilities>
		I display the form for showing user comments for the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<hr width="100%" />
<cfinclude template="qry_get_screen_comments.cfm">
<table class="table table-striped table-bordered table-condensed" width="100%" summary="Table displays comments">
	<caption><h4>Comments</h4></caption>
	<thead>
	<tr>
		<th scope="col">Number</th>
		<th scope="col">Comment Type</th>
		<th scope="col">Comment</th>
		<th scope="col">Entered By</th>
	</tr>
	</thead>
	<tfoot>
	<tr>
		<td colspan="4">
			<div class="btn-group">
				<a href="index.cfm?fuseaction=Requirements.edit_comment&comments_id=0" class="btn">Add New Comment</a>
				<a href="index.cfm?fuseaction=Requirements.view_all_comments" target="comments" class="btn">View All Comments</a>
			</div>
		</td>
	</tr>
	</tfoot>
	<tbody>
	<cfif get_screen_comments.recordcount EQ 0>
	<tr>
		<td colspan="4">No comments listed for this page</td>
	</tr>
	<cfelse>
	<cfoutput query="get_screen_comments">
	<tr>
		<td class="number"><a href="index.cfm?fuseaction=Requirements.edit_comment&comments_id=#comments_id#">#comments_number#</a></td>
		<td>#comment_type#</td>
		<td>#comment_description#</td>
		<td>#created_by#</td>
	</tr>
	</cfoutput>
	</cfif>
	</tbody>
</table>
