
<!--Tools/dsp_invoice_ready.cfm
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
<cfif get_invoice_ready.recordcount>
<table class="table table-striped table-bordered table-condensed tablesorter">
	<caption>
		<h2>Ready to Invoice</h2>
	</caption>
	<thead>
		<tr>
			<th>Customer</th>
			<th>Invoice Amount</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td scope="row">
				Totals
			</td>
			<td class="number">
				#dollarformat(get_invoice_ready_total.invoice_bill_amount)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_invoice_ready">
		<tr>
			<td scope="row">
				<a href="javascript:customer(#customer_id#);" title="View projects">#customer_name# <i class="icon-zoom-in"></i></a> <a href="javascript:generate_invoice(#customer_id#);" data-loading-text="Generating..." class="btn btn-danger"><i class="icon-tag icon-white"></i> Generate Invoice</a>
			</td>
			<td class="number">
				<a href="javascript:get_invoice_detail2(0,#customer_id#);" title="View invoice details">#dollarformat(invoice_bill_amount)#</a>
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<cfelse>
	<div class="alert alert-success">All eligible time has already been invoiced.</div>
</cfif>
</cfoutput>