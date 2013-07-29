
<!--Timekeeping/dsp_time_details_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<div class="row-fluid">
	<div class="span12">
<table class="table table-striped table-bordered">
	<thead>
		<tr>
			<th>
				Employee
			</th>
			<th>
				Hours
			</th>
			<th>
				Reassign Hours
			</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_user_task_time_summary">
		<tr>
			<th scope="row">
				<a href="javascript:tindividual_time#user_account_id#);" title="View individual time entries for #last_name#.">#last_name#</a>
			</td>
			<td class="number">
				<a href="javascript:individual_time(#user_account_id#);" title="View individual time entries for #last_name#.">#decimalformat(hours)#</a>
			</td>
			<td>
				<cfinput type="checkbox" name="reassign_hours" value="#user_account_id#" required="yes" message="Please mark which hours you wish to reassign.">
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
	</div>
</div>