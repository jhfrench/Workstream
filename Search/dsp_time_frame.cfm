
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
		<td>
			Time Frame
		</td>
		<td>
			<input type="Text" name="Task_Name" size="20" onclick="checkbox_task_name()"> Single Word Only
		</td>
</tr>

