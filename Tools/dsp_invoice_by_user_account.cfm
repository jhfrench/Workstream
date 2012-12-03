
<!--Tools/dsp_invoice_by_user_account.cfm
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
		<h1>Invoicing Details</h1>
		<h2>for #get_invoice_by_user_account.project_name#</h2>
	</caption>
	<thead>
		<tr>
			<th>Employee</th>
			<th>Rate (#get_invoice_by_user_account.billable_type#)</th>
			<th>Hours</th>
			<th>Bill</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<td scope="row" colspan="2">
				Totals
			</td>
			<td class="number">
				#dollarformat(get_invoice_by_user_account_total.hours)#
			</td>
			<td class="number">
				#dollarformat(get_invoice_by_user_account_total.bill)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfloop query="get_invoice_by_user_account">
		<tr>
			<td scope="row">
				#employee# <a href="javascript:employee_details(#user_account_id#);" title="View employee details"><i class="icon-user"></i></a>
			</td>
			<td class="number">
				#dollarformat(rate)#
			</td>
			<td class="number">
				<a href="javascript:get_invoice_time_entry(#user_account_id#, #evaluate(variables.field2_name)#);" title="View details for these hours">#decimalformat(hours)#</a>
			</td>
			<td class="number">
				#dollarformat(bill)#
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>