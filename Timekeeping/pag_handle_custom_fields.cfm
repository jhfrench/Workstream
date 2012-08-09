
<!--Timekeeping/pag_handle_custom_fields.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I check to see if the latest task requires any custom fields (which can be determined by searching for active custom fields that correspond to the task's project). If it does, I display the custom fields and submit the user's responses to the DB. Otherwise, the rest of pag_new_task.cfm is run.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
<cfloop query="get_user_fields">
<cfoutput>
	<tr valign="top">
		<td>
			<label for="retire#user_field_id#">Retire<input type="checkbox"<cfif active_ind EQ 1> checked="checked"</cfif> name="retire" id="retire#user_field_id#" value="#user_field_id#"></label>
		</td>
		<td>
			#field_title#: <cfif field_type_id EQ 1>
				<cfinclude template="../common_files/qry_get_drop_down_options.cfm">
				<select name="#field_title#">
					<cfloop query="get_drop_down_options">
					<option value="#get_drop_down_options.user_field_items_id#">#get_drop_down_options.selection_title#</option>
					</cfloop>
				</select>
			<cfelseif field_type_id EQ 2>
				<input type="text" name="display_#get_user_fields.currentrow#" size="8" value="">
			</cfif>
		</td>
	</tr>
</cfoutput>
</cfloop>
</table>

