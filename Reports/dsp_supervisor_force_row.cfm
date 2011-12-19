
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
	<tr<cfif (currentrow MOD 2) EQ 0> bgcolor="##E1E1E1"</cfif> class="SubHeadText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:sup_to_emp('#emp_id#');" onmouseover="MM_displayStatusMsg('View details for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#supervisor_force.employee_name#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:bc_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View completed budgeted tasks for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#cbt#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:bc_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View completed budgeted hours for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#cbh#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:nc_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View completed (budgeted and non-budgeted) tasks for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#cnt#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:nc_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View completed (budgeted and non-budgeted) hours for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#cnh#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:bn_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View budgeted (completed and incomplete) tasks for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#nbt#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:bn_tasks('#emp_id#');" onmouseover="MM_displayStatusMsg('View budgeted (completed and incomplete) hours for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#nbh#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:sup_to_emp('#emp_id#');" onmouseover="MM_displayStatusMsg('View all tasks for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#nnt#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:sup_to_emp('#emp_id#');" onmouseover="MM_displayStatusMsg('View all hours for this employee.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#nnh#</a>
		</td>
	</tr>
</cfoutput>

