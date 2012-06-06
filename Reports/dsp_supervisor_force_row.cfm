
<!--Reports/dsp_supervisor_force_row.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the employee's ForcePlanner report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput query="supervisor_force">
	<tr<cfif (currentrow MOD 2) EQ 0> bgcolor="##E1E1E1"</cfif> class="SubHeadText">
		<td>
			<a href="javascript:sup_to_emp('#emp_id#');"  title="View details for this employee.">#supervisor_force.employee_name#</a>
		</td>
		<td align="right">
			<a href="javascript:bc_tasks('#emp_id#');"  title="View completed budgeted tasks for this employee.">#cbt#</a>
		</td>
		<td align="right">
			<a href="javascript:bc_tasks('#emp_id#');"  title="View completed budgeted hours for this employee.">#cbh#</a>
		</td>
		<td align="right">
			<a href="javascript:nc_tasks('#emp_id#');"  title="View completed (budgeted and non-budgeted) tasks for this employee.">#cnt#</a>
		</td>
		<td align="right">
			<a href="javascript:nc_tasks('#emp_id#');"  title="View completed (budgeted and non-budgeted) hours for this employee.">#cnh#</a>
		</td>
		<td align="right">
			<a href="javascript:bn_tasks('#emp_id#');"  title="View budgeted (completed and incomplete) tasks for this employee.">#nbt#</a>
		</td>
		<td align="right">
			<a href="javascript:bn_tasks('#emp_id#');"  title="View budgeted (completed and incomplete) hours for this employee.">#nbh#</a>
		</td>
		<td align="right">
			<a href="javascript:sup_to_emp('#emp_id#');"  title="View all tasks for this employee.">#nnt#</a>
		</td>
		<td align="right">
			<a href="javascript:sup_to_emp('#emp_id#');"  title="View all hours for this employee.');return document.MM_returnValue;">#nnh#</a>
		</td>
	</tr>
</cfoutput>

