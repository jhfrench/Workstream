
<!--Tools/dsp_invoice_future.cfm
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
<cfif get_invoice_future.recordcount>
<table class="table table-striped table-bordered table-condensed dataTables">
	<caption>
		<h2>Invoice Preview</h2>
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
				#dollarformat(get_invoice_future_total.invoice_bill_amount)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_invoice_future">
		<tr>
			<td scope="row">
				<a href="javascript:customer(#customer_id#);" title="View projects">#customer_name# <i class="icon-zoom-in"></i></a>
			</td>
			<td class="number">
				<a href="javascript:get_invoice_detail3(0,#customer_id#);" title="View invoice details">#dollarformat(invoice_bill_amount)#</a>
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
<cfelse>
	<div class="alert alert-warning">There is no entered time that will be eligible for invoicing.</div>
</cfif>
</cfoutput>