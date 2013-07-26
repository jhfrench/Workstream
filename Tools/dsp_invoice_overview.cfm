
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
			<th>Invoiced</th>
			<th>Invoice/Work Date</th>
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
				<a href="javascript:customer(#customer_id#);" title="View projects">#customer_name# <i class="icon-zoom-in"></i></a>
			</td>
			<td>
				<cfif major_sort_order EQ 1>
					<i class="icon-ok" title="This invoice has been generated"></i>
				<cfelseif show_generate_button_ind>
					<a href="javascript:generate_invoice(#customer_id#);" class="btn btn-danger"><i class="icon-tag icon-white"></i> Generate Invoice</a>
				<cfelse>
					not yet elligible
				</cfif>
			</td>
			<td scope="row" class="date">
				#dateformat(created_date, "m/d/yyyy")#
			</td>
			<td>
				#invoicer#
			</td>
			<td class="number">
				<a href="javascript:get_invoice_detail#major_sort_order#(#invoice_id#,#customer_id#);" title="View invoice details">#dollarformat(invoice_bill_amount)#</a>
			</td>
			<td class="number">
				#dollarformat(invoice_received_amount)#
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>