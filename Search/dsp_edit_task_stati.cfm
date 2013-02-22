
<!--Search/dsp_edit_task_stati.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the pull down for team members for the search page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_get_ref_task_status.cfm">
	<tr valign="top">
		<td class="btn-group">
			<input type="checkbox" name="task_stati_box" value="1"<cfif len(attributes.task_stati)> checked="checked"</cfif> />
		</td>
		<td>Task Status</td>
		<td>
			<select name="task_stati" multiple="multiple" size="4" onclick="checkbox_task_stati()">
			<cfoutput query="get_ref_task_status">
				<option value="#task_status_id#"<cfif listfind(attributes.task_stati, get_ref_task_status.task_status_id,",")> selected="selected"</cfif>>#status#</option>
			</cfoutput>
			</select>
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_stati">