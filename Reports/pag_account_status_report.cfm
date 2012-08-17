
<!--Reports/pag_account_status_report.cfm
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
<cfinclude template="qry_account_status_report.cfm">

<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Account Task Matrix</h2></caption>
	<thead>
		<tr>
			<th>Project</th>
			<th><abbr title="task id">ID</abbr></th>
			<th>Name</th>
			<th>Status</th>
			<th>Priority</th>
			<th>Assigned</th>
			<th>Due</th>
			<th>Completed</th>
			<th>Owner</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="account_status_report"> 
		<tr>
			<td>#project_name#</td>
			<td class="number">#task_id#</td>
			<td><a href="javascript:task_jump('#task_id#');">#task_name#</a></td>
			<td>#status#</td>
			<td>#priority#</td>
			<td class="date">#dateformat(assigned_date,"m/d/yyyy")#</td>
			<td class="date">#dateformat(due_date,"m/d/yyyy")#</td>
			<td class="date">#dateformat(complete_date,"m/d/yyyy")#</td>
			<td>#owner#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_jump" fuseaction="Timekeeping.task_details" field_name="task_id">