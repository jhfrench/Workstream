<!-- Requirements/dsp_screen_comments.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_screen_comments.cfm">
	<responsibilities>
		I display the form for showing user comments for the page the user is viewing.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<div class="datachart" style="border:1px solid #999999">
<table bgcolor="#FFFFFF" border="1" cellpadding="3" cellspacing="0" cols="4" width="100%" summary="table displays comments">
	<tr bgcolor="#999999">
		<td align="left" colspan="4">
			<h4>Comments</h4>
		</td>
	</tr>
	<tr bgcolor="#999999">
		<th align="left"><label for="comments_number">Number</label></th>
		<th align="left"><label for="comment_type">Comment Type</label></th>
		<th align="left"><label for="comment_description">Comment</label></th>
		<th align="left"><label for="created_by">Entered by</label></th>
	</tr>
	<cfif get_screen_comments.recordcount EQ 0>
	<tr>
		<td colspan="4">No comments listed for this page</td>
	</tr>
	<cfelse>
	<cfoutput query="get_screen_comments">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cccccc';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td id="comments_number"><a href="index.cfm?fuseaction=Requirements.edit_comment&comments_id=#comments_id#">#comments_number#</a></td>
		<td id="comment_type">#comment_type#</td>
		<td id="comment_description">#comment_description#</td>
		<td id="created_by">#created_by#</td>
	</tr>
	</cfoutput>
	</cfif>
	<!--- add link 'Add New Comments' --->
	<tr><td colspan="4">&nbsp;</td></tr>
	<tr>
		<td colspan="4" align="left" class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});">
			<a href="index.cfm?fuseaction=Requirements.edit_comment&comments_id=0">Add New Comment</a> | <a href="index.cfm?fuseaction=Requirements.view_all_comments" target="comments">View All Comments</a>
		</td>
	</tr>
	<tr><td colspan="4">&nbsp;</td></tr>
</table>
</div>
