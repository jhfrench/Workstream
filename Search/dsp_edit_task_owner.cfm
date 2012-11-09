
<!--Search/dsp_edit_task_owner.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the pull down for team members for the search page.
	||
	Name: 
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
	<tr valign="top">
		<td class="btn-group">
			<input type="checkbox" name="task_owner_box" value="1" <cfif len(attributes.Task_Owner)> checked="checked"</cfif>>
		</td>
		<td>Task Owner</td>
		<td>
			<cfmodule template="../common_files/dsp_edit_team_select.cfm" select_name="Task_Owner" select_name_value="#attributes.task_owner#" multi="1" user_account_id=0 onChange="checkbox_task_owner()">
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_owner">