
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<tr valign="top">
		<td align="center">
			<input type="checkbox" name="task_owner_box" value="1" class="RegText">
		</td>
		<td class="RegText">Task Owner</td>
		<td>
			<cfmodule template="../common_files/dsp_team_select.cfm" select_name="Task_Owner" multi="1" emp_id=0 onChange="checkbox_task_owner()" class="RegText">
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_owner">

