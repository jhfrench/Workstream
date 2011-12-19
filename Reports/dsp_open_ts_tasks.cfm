
<!--Reports/dsp_open_ts_tasks.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I show, at a glance, statistics about currently unresolved tech support tasks. I also allow the user to drill-down to the task's details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfmodule template="../common_files/dsp_section_title.cfm" align="left" colspan="8" gutter="0" section_color="5F5F5F" section_title="&nbsp;Open Tech Support Tasks" title_class="SubHeadText#session.workstream_text_size#White">
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td class="RegText#session.workstream_text_size#Bd">Due</td>
		<td class="RegText#session.workstream_text_size#Bd">ID</td>
		<td class="RegText#session.workstream_text_size#Bd">Budgeted Hours</td>
		<td class="RegText#session.workstream_text_size#Bd">Current Owner</td>
		<td class="RegText#session.workstream_text_size#Bd">Name</td>
		<td class="RegText#session.workstream_text_size#Bd">Status</td>
		<td class="RegText#session.workstream_text_size#Bd">Priority</td>
	</tr>
</cfoutput>
<cfoutput query="open_ts_tasks">
	<tr<cfif open_ts_tasks.currentrow MOD 2> bgcolor="##e1e1e1"</cfif>>
		<td class="RegText#session.workstream_text_size#">#dateformat(due_date,"mm/dd/yy")#</td>
		<td class="RegText#session.workstream_text_size#">#task_id#</td>
		<td class="RegText#session.workstream_text_size#">#budgeted_hours#</td>
		<td class="RegText#session.workstream_text_size#">#lname#</td>
		<td class="RegText#session.workstream_text_size#"><a href="javascript:list_to_task('#task_id#');" onmouseover="MM_displayStatusMsg('View task details for task #task_id#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#name#</a></td>
		<td class="RegText#session.workstream_text_size#">#status#</td>
		<td class="RegText#session.workstream_text_size#">#priority#</td>
	</tr>
</cfoutput>

