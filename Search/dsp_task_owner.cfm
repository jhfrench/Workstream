
<!--Search/dsp_team_select.cfm
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
		<td align="center">
			<input type="checkbox" name="task_owner_box" value="1">
		</td>
		<td>Task Owner</td>
		<td>
			<cfmodule template="../common_files/dsp_team_select.cfm" select_name="Task_Owner" multi="1" emp_id=0 onChange="checkbox_task_owner()">
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_owner">

