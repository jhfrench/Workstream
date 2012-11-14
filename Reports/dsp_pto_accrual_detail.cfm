
<!--Reports/dsp_pto_accrual_detail_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<cfif get_pto_detail.recordcount>
<table class="table table-striped table-bordered table-condensed">
	<caption>
		<h1>Personal Time Off</h1>
		<h2>#get_demographics.first_name# #get_demographics.last_name#</h2>
	</caption>
	<thead>
		<tr>
			<th>Date</th>
			<th>Description</th>
			<th>Credit</th>
			<th>Debit</th>
			<th>Balance</th>
		</tr>
	</thead>
	<tfoot>
		<tr>
			<th colspan="2">
				Totals
			</th>
			<td class="number">
				#decimalformat(get_pto_year_summary.hours_in)#
			</td>
			<td class="number">
				#decimalformat(get_pto_year_summary.hours_out)#
			</td>
			<td class="number">
				#decimalformat(get_pto_year_summary.hours_in-get_pto_year_summary.hours_out)#
			</td>
		</tr>
	</tfoot>
	<tbody>
	<cfoutput query="get_pto_detail">
		<tr>
			<td class="date">
				#dateformat(transaction_date,'m/d/yyyy')#
			</td>
			<td>
				<cfif hours_out EQ 0>#comments#<cfelse><a href="javascript:time_edit('#time_entry_id#');"><cfif len(comments)>#comments#<cfelse>PTO Usage</cfif></a></cfif>
			</td>
			<td class="number">
				<cfif hours_in>#decimalformat(hours_in)#<cfelse>&nbsp;</cfif>
			</td>
			<td class="number">
				<cfif hours_out>#decimalformat(hours_out)#<cfelse>&nbsp;</cfif>
			</td><cfset variables.result=variables.result+hours_in-hours_out>
			<td class="number">
				#decimalformat(variables.result)#
			</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
<cfelse>
	<div class="alert alert-info">
		No <abbr title="Personal Time Off">PTO</abbr> records found for #get_demographics.first_name# #get_demographics.last_name#.
	</div>
</cfif>
</cfoutput>