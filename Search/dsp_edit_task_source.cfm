
<!--Search/dsp_edit_task_source.cfm
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
<tr valign="top">
	<td align="center">
		<input type="checkbox" name="task_source_box" value="1" <cfif len(attributes.Task_Source)>checked="checked"</cfif>>
	</td>
	<td>Task Source</td>
	<td>
		<cfmodule template="../common_files/dsp_edit_team_select.cfm" colspan="1" select_name="Task_Source" select_name_value="#attributes.task_source#" multi="1" emp_id="0" onChange="checkbox_task_source()">
	</td>
</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_source">


