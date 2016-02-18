
<!--Tools/dsp_invoice_time_entry.cfm
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
<table class="table table-striped table-bordered table-condensed dataTables" data-page-length='25' data-order='[[0, "asc"], [2, "asc"]]'>
	<caption><h1>Work Notes</h1> <h3>for #get_invoice_time_entry.employee# <a href="javascript:employee_details(#get_invoice_time_entry.user_account_id#);" title="View employee details"><i class="icon-user"></i></a></h3></caption>
	<thead>
		<tr>
			<th>Task <abbr title="Identifier">ID</abbr></th>
			<th>Task</th>
			<th>Date</th>
			<th>Note</th>
			<th>Hours</th>
			<th>Bill</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td scope="row" colspan="4">
				Totals
			</td>
			<td class="number">
				#numberformat(get_invoice_time_entry_total.hours)#
			</td>
			<td class="number">
				#dollarformat(get_invoice_time_entry_total.bill)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_invoice_time_entry">
		<tr>
			<td><a href="javascript:task_details(#task_id#);" title="View task #task_id#">#task_id#</a></td>
			<td><a href="javascript:task_details(#task_id#);" title="View task #task_id#">#task_name#</a></td>
			<td class="date" data-sort="#dateformat(created_date, "work_date")#">#dateformat(work_date, "mm/dd/yyyy")#</td>
			<td>#note#</td>
			<td class="number"><a href="javascript:time_entry_edit(#time_entry_id#);" title="Edit note details">#decimalformat(hours)#</a></td>
			<td class="number">#dollarformat(bill)#</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>