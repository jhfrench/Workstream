<!-- Requirements/dsp_edit_comments.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_comments.cfm">
	<responsibilities>
		I display the form for adding or editing user comments.
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
<cfparam name="attributes.comments_id" default="0">
<!--- begin form area --->
<cfoutput>
<cfform name="form_comments" action="index.cfm?fuseaction=Requirements.edit_comment" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the table held within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.comments_id EQ 0>ADD NEW COMMENT<cfelse>EDIT EXISTING COMMENT</cfif></strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays comment">
			<tr>
				<td>
					<label for="comments_type_id">Comment Type</label>:
					<br /><cfselect name="comments_type_id" id="comments_type_id" query="get_comments_type" value="comments_type_id" display="description" selected="#get_comment.comments_type_id#" required="yes" message="Please specify the type of comments you are entering." />
				</td>
				<td colspan="2">
					<label for="screen_id">Fuseaction</label>:
					<br /><cfselect name="screen_id" id="screen_id" query="get_fuseactions" value="screen_id" display="fuseaction" selected="#variables.screen_id#" required="yes" message="Please specify the fuseaction for this comments." />
				</td>
			</tr>
			<tr>
				<td>
					<label for="comments_number">Comment Number</label>:
					<br />
					<input type="number" name="comments_number" id="comments_number" value="#get_comment.comments_number#" step="1" min="0" required="required" class="span5 number" />
				</td>
				<cfif attributes.comments_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td>
					<span title="associated with the radio buttons to the right">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes</label>
					<cfinput type="radio" name="active_ind" id="active_ind_no" value="0"><label for="active_ind_no">No</label>
				</td>
				</cfif>
				<td>
					<label for="sort_order">Sort Order</label>:
					<br />
					<input type="number" name="sort_order" id="sort_order" value="#get_comment.sort_order#" step="1" min="0" max="100" required="required" class="span5 number" />
				</td>
			</tr>
			<tr>
				<td colspan="3">
					<label for="comment_description">Comment description</label>:
					<br />
					<cfif get_comment.active_ind EQ 0>
						#trim(get_comment.comment_description)#
					<cfelse>
						<textarea name="comment_description" id="comment_description" cols="50" rows="10">#trim(get_comment.comment_description)#</textarea>
					</cfif>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td class="btn-group">
			<input type="hidden" name="comments_id" value="#attributes.comments_id#" />
			<cfif get_comment.active_ind EQ 0>
				You cannot edit an inactive comment
			<cfelse>
			<input type="submit" name="send_req" value="Update Comments" class="btn btn-primary" />
			</cfif>
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
