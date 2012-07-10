
<!--Search/dsp_team_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I ask for the input for the task id.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr>
		<td align="center"><input type="checkbox" name="task_id_box" value="1"></td>
		<td>Task ID</td>
		<td><cfinput type="Text" name="task_id" size="50" onclick="checkbox_task_id()"></td>
</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_id">

