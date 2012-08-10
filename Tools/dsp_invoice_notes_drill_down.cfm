
<!--Tools/dsp_invoice_notes_drill_down.cfm
	Author: Jeromy F  -->
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
<cfoutput query="invoice_notes_drill_down">
	<tr>
		<td class="number"><a href="javascript:note_to_task(#task_id#);" title="View task #task_id#.">#task_id#</td>
		<td class="date">#dateformat(date,"mm/dd/yyyy")#</td>
		<td class="number"><a href="javascript:time_entry_edit(#time_entry_id#);" title="Edit note details">#hours#</td>
		<td>#note#</td>
	</tr>
</cfoutput>