
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr>
		<td align="center"><input type="checkbox" name="task_id_box" value="1" <cfif len(attributes.task_id)>checked="checked"</cfif> class="RegText#session.workstream_text_size#"></td>
		<td class="RegText#session.workstream_text_size#">Task ID</td>
		<td class="RegText#session.workstream_text_size#"><cfinput type="Text" name="task_id" size="50" value="#attributes.task_id#" onclick="checkbox_task_id()" class="RegText#session.workstream_text_size#"></td>
</tr>
</cfoutput>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_id">

