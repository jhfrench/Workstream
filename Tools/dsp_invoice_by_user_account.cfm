
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
SELECT Demographics.user_account_id, Demographics.last_name||', '||Demographics.first_name AS employee, Billing_Rate.rate,
, SUM(Time_Entry.hours) AS ,
	SUM(Time_Entry.hours * COALESCE(Billing_Rate.rate,0)) AS 
	<tfoot>
		<tr>
			<td scope="row" colspan="2">
				Totals
			</td>
			<td class="number">
				#dollarformat(get_invoice_by_user_account_total.hours)#
			</td>
			<td class="number">
				#dollarformat(get_invoice_by_user_account_total.payment_received_amount)#
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
				<a href="javascript:get_invoice_time_entry_invoice_id(#user_account_id#, #evaluate(variables.field2_name)#);" title="View details for these hours">#decimalformat(hours)#</a>
			</td>
			<td class="number">
				#dollarformat(bill)#
			</td>
		</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>