
<!--Reports/dsp_supervisor_force.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row headers for the employee's ForcePlanner report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<form name="form_supervisor_force" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="well form-inline">
	<label for="from_date">Start</label>
	<input type="date" name="from_date" id="from_date" min="#application.application_specific_settings.workstream_start_date#" max="#dateformat(now()+30, 'yyyy-mm-dd')#" value="#dateformat(attributes.from_date, 'yyyy-mm-dd')#" maxlength="10" class="span2 date" />
	<label for="to_date">End</label>
	<input type="date" name="to_date" id="to_date" min="#application.application_specific_settings.workstream_start_date#" max="#dateformat(now()+30, 'yyyy-mm-dd')#" value="#dateformat(attributes.from_date, 'yyyy-mm-dd')#" maxlength="10" class="span2 date" />
	<input type="submit" name="submit" value="Retrieve Tasks" class="btn btn-primary" />
</form>
</cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>ForcePlanner Report</h2></caption>
	<thead>
		<tr>
			<th></th>
			<th colspan="4">
				Complete
			</th>
			<th colspan="4">
				Not Complete
			</th>
		</tr>
		<tr>
			<th></th>
			<th colspan="2">
				Budgeted
			</th>
			<th colspan="2">
				Not Budgeted
			</th>
			<th colspan="2">
				Budgeted
			</th>
			<th colspan="2">
				Not Budgeted
			</th>
		</tr>
		<tr>
			<th>
				Employee
			</th>
			<th>
				Tasks
			</th>
			<th>
				Hours
			</th>
			<th>
				Tasks
			</th>
			<th>
				Hours
			</th>
			<th>
				Tasks
			</th>
			<th>
				Hours
			</th>
			<th>
				Tasks
			</th>
			<th>
				Hours
			</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_forceplanner_supervisor">
		<tr>
			<td>
				<a href="javascript:sup_to_emp(#emp_id#);" title="View details for this employee.">#get_forceplanner_supervisor.employee_name#</a>
			</td>
			<td class="number">
				<a href="javascript:bc_tasks(#emp_id#);" title="View completed budgeted tasks for this employee.">#cbt#</a>
			</td>
			<td class="number">
				<a href="javascript:bc_tasks(#emp_id#);" title="View completed budgeted hours for this employee.">#cbh#</a>
			</td>
			<td class="number">
				<a href="javascript:nc_tasks(#emp_id#);" title="View completed (budgeted and non-budgeted) tasks for this employee.">#cnt#</a>
			</td>
			<td class="number">
				<a href="javascript:nc_tasks(#emp_id#);" title="View completed (budgeted and non-budgeted) hours for this employee.">#cnh#</a>
			</td>
			<td class="number">
				<a href="javascript:bn_tasks(#emp_id#);" title="View budgeted (completed and incomplete) tasks for this employee.">#nbt#</a>
			</td>
			<td class="number">
				<a href="javascript:bn_tasks(#emp_id#);" title="View budgeted (completed and incomplete) hours for this employee.">#nbh#</a>
			</td>
			<td class="number">
				<a href="javascript:sup_to_emp(#emp_id#);" title="View all tasks for this employee.">#nnt#</a>
			</td>
			<td class="number">
				<a href="javascript:sup_to_emp(#emp_id#);" title="View all hours for this employee.');return document.MM_returnValue;">#nnh#</a>
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>