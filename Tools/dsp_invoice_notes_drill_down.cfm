
<!--Tools/dsp_invoice_notes_drill_down.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the notes for an employee/month/year/project code.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Work Notes</h2> <h3>for #get_demographics.last_name#</h3></caption>
	<thead>
		<tr>
			<th>Task <abbr title="Identifier">ID</abbr></th>
			<th>Date</th>
			<th>Hours</th>
			<th>Notes</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td colspan="4">
				Total Hours: #get_invoice_notes_drill_down_total.hours#
			</td>
		</tr>
	</tfoot>
	<tbody>
<cfloop query="invoice_notes_drill_down">
	<tr>
		<td class="number"><a href="javascript:note_to_task(#task_id#);" title="View task #task_id#.">#task_id#</td>
		<td class="date">#dateformat(work_date,"m/d/yyyy")#</td>
		<td class="number"><a href="javascript:time_entry_edit(#time_entry_id#);" title="Edit note details">#decimalformat(hours)#</td>
		<td>#note#</td>
	</tr>
</cfloop>
	</tbody>
</table>
</cfoutput>