
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
		<td class="RegText">
			<a href="javascript:sup_to_emp('#emp_id#');" onmouseover="MM_displayStatusMsg('View details for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#supervisor_force.employee_name#</a>
		</td>
		<td align="right" class="RegText">
			<a href="javascript:bc_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View completed budgeted tasks for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#cbt#</a>
		</td>
		<td align="right" class="RegText">
			<a href="javascript:bc_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View completed budgeted hours for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#cbh#</a>
		</td>
		<td align="right" class="RegText">
			<a href="javascript:nc_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View completed (budgeted and non-budgeted) tasks for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#cnt#</a>
		</td>
		<td align="right" class="RegText">
			<a href="javascript:nc_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View completed (budgeted and non-budgeted) hours for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#cnh#</a>
		</td>
		<td align="right" class="RegText">
			<a href="javascript:bn_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View budgeted (completed and incomplete) tasks for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#nbt#</a>
		</td>
		<td align="right" class="RegText">
			<a href="javascript:bn_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View budgeted (completed and incomplete) hours for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#nbh#</a>
		</td>
		<td align="right" class="RegText">
			<a href="javascript:sup_to_emp('#emp_id#');" onmouseover="MM_displayStatusMsg('View all tasks for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#nnt#</a>
		</td>
		<td align="right" class="RegText">
			<a href="javascript:sup_to_emp('#emp_id#');" onmouseover="MM_displayStatusMsg('View all hours for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#nnh#</a>
		</td>
	</tr>
</cfoutput>

