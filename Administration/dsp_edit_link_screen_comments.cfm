<!-- Administration/dsp_edit_link_screen_comments.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_link_screen_comments.cfm">
	<responsibilities>
		I display the form for link screen comments maintenance.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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

<cfoutput>
<cfform name="form_link_screen_comments" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">

<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="the table head here describes the table within that houses the form">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.l_s_c_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> LINK SCREEN COMMENTS</strong></th></tr>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays comments">
			<tr>
				<td width="15"><label for="comments_id">Comments</label>: </td>
				<td colspan="2">
					<cfselect name="comments_id" id="comments_id" query="get_comments" value="comments_id" display="description"
						selected="#attributes.comments_id#" required="yes" message="Please specify comments.">
					</cfselect>
				</td>
			</tr>
			<tr>
				<td width="15"><label for="screen_id">Screen</label>: </td>
				<td colspan="2">
					<cfselect name="screen_id" id="screen_id" query="get_ref_screen" value="screen_id" display="fuseaction" selected="#attributes.screen_id#"
						required="yes" message="Please specify fuseaction.">
					</cfselect>
				</td>
			</tr>
			<tr>
				<td width="15"><label for="sort_order">Sort Order</label>: </td>
				<td><cfinput type="text" name="sort_order" id="sort_order" size="3" maxlength="3" value="#get_link_screen_comments.recordcount+1#"
						required="yes" message="Please enter sort order.">
				</td>
				<cfif attributes.l_s_c_id EQ 0>
					<input type="hidden" name="active_ind" value="1"/>
				<cfelse>
				<td><span title="describes the purpose of the radio buttons that follow">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
				 		<cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td align="center">
			<input type="hidden" name="created_by" value="#session.user_account_id#"/>
			<input type="hidden" name="l_s_c_id" value="#attributes.l_s_c_id#"/>
			<input type="submit" alt="submit" value="Submit" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>

