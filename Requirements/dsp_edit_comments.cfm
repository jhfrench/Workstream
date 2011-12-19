<!-- Requirements/dsp_edit_comments.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_comments.cfm">
	<responsibilities>
		I display the form for adding or editing user comments.
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
<cfparam name="attributes.comments_id" default="0">
<!--- begin form area --->
<cfoutput>
<cfform name="form_comments" action="index.cfm?fuseaction=Requirements.edit_comment" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="Allows user to enter comments about an application screen.">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.comments_id EQ 0>ADD NEW COMMENT<cfelse>EDIT EXISTING COMMENT</cfif></strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="table displays comment">
			<tr>
				<td colspan="2">
					<label for="screen_id">Fuseaction</label>:
					<br /><cfselect name="screen_id" id="screen_id" query="get_fuseactions" value="screen_id" display="display" selected="#variables.screen_id#" required="yes" message="Please specify the fuseaction for this comments." />
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="comments_type_id">Comment Type</label>:
					<br /><cfselect name="comments_type_id" id="comments_type_id" query="get_comments_type" value="comments_type_id" display="description" selected="#get_comment.comments_type_id#" required="yes" message="Please specify the type of comments you are entering." />
				</td>
			</tr>
			<tr>
				<td>
					<label for="comments_number">Comment Number</label>:
					<br /><cfinput type="text" name="comments_number" id="comments_number" value="#get_comment.comments_number#" size="3" maxlength="200" required="yes" validate="integer" message="Please enter a comments number.">
				</td>
				<td>
					<label for="sort_order">sort order</label>:
					<br /><cfinput type="text" name="sort_order" id="sort_order" value="#get_comment.sort_order#" size="3" maxlength="3" required="yes" validate="integer" message="Please enter a sort order.">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label for="comment_description">Comment description</label>:
					<br />
					<cfif get_comment.active_ind EQ 0>
						#trim(get_comment.comment_description)#
					<cfelse>
						<textarea name="comment_description" id="comment_description" cols="50" rows="10">#trim(get_comment.comment_description)#</textarea>
					</cfif>
					<cfif attributes.comments_id EQ 0>
						<input type="hidden" name="active_ind" value="1" />
					<cfelse>
						<p>
							<span title="associated with the radio buttons to the right">Active?</span>
							<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes</label>
							<cfinput type="radio" name="active_ind" id="active_ind_no" value="0"><label for="active_ind_no">No</label>
						</p>
					</cfif>
				</td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="comments_id" value="#attributes.comments_id#" />
			<cfif get_comment.active_ind EQ 0>
				You cannot edit an inactive comments
			<cfelse>
			<input type="submit" name="send_req" value="Update Comments" alt="Update Comments" />
			</cfif>
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
