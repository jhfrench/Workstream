
<!--Reports/dsp_tech_support_open_tasks.cfm
	Author: Jeromy F -->
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
<table class="table table-striped table-bordered table-condensed">
	<caption><h3>Open Tech Support Tasks</h3></caption>
	<thead>
		<tr>
			<th>ID</th>
			<th>Owner</th>
			<th>Task</th>
			<th>Priority</th>
			<th>Budgeted Hours</th>
			<th>Status</th>
			<th>Due</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="open_ts_tasks">
		<tr>
			<td>#task_id#</td>
			<td>#last_name#</td>
			<td><a href="javascript:list_to_task('#task_id#');">#name#</a></td>
			<td>#priority#</td>
			<td class="number">#budgeted_hours#</td>
			<td>#status#</td>
			<td class="date">#dateformat(due_date,"m/d/yyyy")#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>