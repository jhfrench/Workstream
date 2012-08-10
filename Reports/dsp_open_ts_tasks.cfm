
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
<cfmodule template="../common_files/dsp_section_title.cfm" align="left" colspan="8" gutter="0" section_color="5F5F5F" section_title="&nbsp;Open Tech Support Tasks" title_class="SubHeadTextWhite">
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td class="RegTextBd">Due</td>
		<td class="RegTextBd">ID</td>
		<td class="RegTextBd">Budgeted Hours</td>
		<td class="RegTextBd">Current Owner</td>
		<td class="RegTextBd">Name</td>
		<td class="RegTextBd">Status</td>
		<td class="RegTextBd">Priority</td>
	</tr>
</cfoutput>
<cfoutput query="open_ts_tasks">
	<tr<cfif open_ts_tasks.currentrow MOD 2> bgcolor="##e1e1e1"</cfif>>
		<td>#dateformat(due_date,"m/d/yyyy")#</td>
		<td>#task_id#</td>
		<td>#budgeted_hours#</td>
		<td>#lname#</td>
		<td><a href="javascript:list_to_task('#task_id#');">#name#</a></td>
		<td>#status#</td>
		<td>#priority#</td>
	</tr>
</cfoutput>

