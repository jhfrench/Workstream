
<!--Tools/dsp_invoice_detail.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column headers for the invoice list.
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
<table class="table table-striped table-bordered table-condensed tablesorter">
	<caption>
		<h1>Invoicing Details</h1>
		<h2>for #get_invoice_detail.customer_name#</h2>
	</caption>
	<thead>
		<tr>
			<th>Project</th>
			<th>Billable Type</th>
			<th>Invoice Date</th>
			<th>Invoiced By</th>
			<th>Invoice Amount</th>
			<th>Received Amount</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td scope="row" colspan="4">
				Totals
			</td>
			<td class="number">
				#dollarformat(get_invoice_detail_total.total_bill_amount)#
			</td>
			<td class="number">
				#dollarformat(get_invoice_detail_total.payment_received_amount)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_invoice_detail">
		<tr>
			<td scope="row">
				<a href="javascript:edit_project(#project_id#);" title="View project details">#project_code# #project_name# <i class="icon-zoom-in"></i></a>
			</td>
			<td>
				#billable_type#
			</td>
			<td scope="row" class="date">
				#dateformat(created_date, "m/d/yyyy")#
			</td>
			<td>
				#invoicer#
			</td>
			<td class="number">
				<a href="javascript:get_invoice_by_user_account(#invoice_id#,#project_id#);" title="View invoice details">#dollarformat(total_bill_amount)#</a>
			</td>
			<td class="number">
				#dollarformat(payment_received_amount)#
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>