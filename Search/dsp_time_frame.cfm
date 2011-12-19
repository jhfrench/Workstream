
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
<cf_htmlhead>
<script language="JavaScript">
function checkbox_task_name()
{
document.input_attributes.task_name_box.checked=true
}
</script>
</cf_htmlhead>
<tr>
		<td align="center">
			<input type="checkbox" name="time_frame_box" value="1">
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			Time Frame
		</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<input type="Text" name="Task_Name" size="20" onclick="checkbox_task_name()" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"> Single Word Only
		</td>
</tr>

