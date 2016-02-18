
<!--Tools/dsp_invoice_previous.cfm
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
<table class="table table-striped table-bordered table-condensed dataTables" data-page-length='25' data-order='[[ 1, "asc" ], [ 0, "asc" ], [ 3, "desc" ]]'>
	<caption>
		<h2>Previously Invoiced</h2>
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
				#dollarformat(get_invoice_previous_total.invoice_bill_amount)#
			</td>
			<td class="number">
				#dollarformat(get_invoice_previous_total.invoice_received_amount)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_invoice_previous">
		<tr>
			<td scope="row">
				<a href="javascript:customer(#customer_id#);" title="View projects">#customer_name# <i class="icon-zoom-in"></i></a>
			</td>
			<td scope="row" class="date" data-sort="#dateformat(created_date, "yyyymmdd")#">
				#dateformat(created_date, "mm/dd/yyyy")#
			</td>
			<td>
				#invoicer#
			</td>
			<td class="number">
				<a href="javascript:get_invoice_detail1(#invoice_id#,#customer_id#);" title="View invoice details">#dollarformat(invoice_bill_amount)#</a>
			</td>
			<td class="number">
				#dollarformat(invoice_received_amount)#
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>