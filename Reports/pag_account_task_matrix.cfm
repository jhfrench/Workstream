
<!--Reports/pag_account_task_matrix.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_account_task_matrix.cfm">

<table class="table table-striped table-bordered table-condensed">
	<caption><h1>Account Task Matrix</h1></caption>
	<thead>
		<tr>
			<th><abbr title="task id">ID</abbr></th>
			<th class="hidden-phone hidden-tablet">Owner</th>
			<th>Task</th>
			<th class="hidden-phone hidden-tablet">Project</th>
			<th class="hidden-phone">Priority</th>
			<th>Status</th>
			<th>Assigned</th>
			<th>Due</th>
			<th>Completed</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_account_task_matrix"> 
		<tr>
			<td class="number" scope="row">#task_id#</td>
			<td class="hidden-phone hidden-tablet">#owner#</td>
			<td><a href="javascript:task_jump('#task_id#');">#task_name#</a></td>
			<td class="hidden-phone hidden-tablet">#project_name#</td>
			<td class="hidden-phone">#priority#</td>
			<td>#task_status#</td>
			<td class="date">#dateformat(assigned_date,"m/d/yyyy")#</td>
			<td class="date">#dateformat(due_date,"m/d/yyyy")#</td>
			<td class="date">#dateformat(complete_date,"m/d/yyyy")#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_jump" fuseaction="Timekeeping.task_details" field_name="task_id">