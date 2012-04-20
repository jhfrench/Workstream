
<!--Tools/dsp_invoice_details.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the hour details for a given month/year and project code. The time is aggregated by employee and drills down to the notes/time_entries for that employee/month/year/project code.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfset variables.sum_hours=0>
<cfset variables.sum_bill=0>
</cfsilent>
<cfoutput query="invoice_details">
<tr>
	<td align="center" class="date">
		#attributes.month#/#attributes.year#
	</td>
	<td>
		#project_code#
	</td>
	<td>
		<a href="javascript:list_to_emp('#emp_id#');" class="RegText">#name#</a>
	</td>
	<td class="number">
		<a href="javascript:list_to_emp('#emp_id#');" class="RegText">#pin#</a>
	</td>
	<td class="number">
		#decimalformat(rate)#
	</td>
	<td class="number">
		<a href="javascript:emp_to_notes('#emp_id#|#attributes.project_id#','#attributes.drill_through#');" class="RegText">#decimalformat(hours)#</a><cfset variables.sum_hours=sum_hours+hours>
	</td>
	<td class="number">
		#dollarformat(bill)#<cfset variables.sum_bill=sum_bill+bill>
	</td>
</tr>
</cfoutput>
<cfoutput>
<tr>
	<td colspan="5" class="SubHeadText">Totals:<span class="RegText"> #invoice_details.recordcount# Employee<cfif invoice_details.recordcount NEQ 1>s</cfif></span></td>
	<td class="number">#decimalformat(variables.sum_hours)#</td>
	<td class="number">#dollarformat(variables.sum_bill)#</td>
</tr>
</cfoutput>
