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
	<tfoot>
	<!--- add link 'Add New Comments' --->
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr>
		<td colspan="4" align="left" class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});">
			<a href="index.cfm?fuseaction=Requirements.edit_comment&comments_id=0">Add New Comment</a> | <a href="index.cfm?fuseaction=Requirements.view_all_comments" target="comments">View All Comments</a>
		</td>
	</tr>
	<tr><td colspan="4">&nbsp;</td></tr>
	</tfoot>
</table>
