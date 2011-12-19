
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
	<tr>
		<td align="center">
			<input type="checkbox" name="task_name_box" value="1" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			Task Name
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<input type="Text" name="Task_Name" size="30" onclick="checkbox_task_name()" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"> Separate multiple phrases with commas.
		</td>
	</tr>
<cfmodule template="../common_files/act_autocheck_checkbox_js.cfm" checkbox_name="task_name">

