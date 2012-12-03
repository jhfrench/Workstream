
<!--Tools/dsp_invoice_overview.cfm
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
<table class="table table-striped table-bordered table-condensed">
	<caption>
		<h1>Invoicing Overview</h1>
	</caption>
	<thead>
		<tr>
			<th>Customer</th>
			<th>Invoice Date</th>
			<th>Invoiced By</th>
			<th>Invoice Amount</th>
			<th>Received Amount</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td scope="row" colspan="3">
				Totals
			</td>
			<td class="number">
				#dollarformat(get_invoice_overview_total.invoice_bill_amount)#
			</td>
			<td class="number">
				#dollarformat(get_invoice_overview_total.invoice_received_amount)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_invoice_overview">
		<tr>
			<td scope="row">
				<a href="javascript:get_invoice_detail(#invoice_id#,#customer_id#);" title="View invoice details">#customer_name#</a>
			</td>
			<td scope="row" class="date">
				<cfif NOT invoice_id><a href="javascript:" class="btn btn-danger disabled"><i class="icon-tag icon-white"></i> Generate Invoice</a><cfelse>#dateformat(created_date, "m/d/yyyy")#</cfif>
			</td>
			<td>
				#invoicer#
			</td>
			<td class="number">
				#dollarformat(invoice_bill_amount)#
			</td>
			<td class="number">
				#dollarformat(invoice_received_amount)#
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>