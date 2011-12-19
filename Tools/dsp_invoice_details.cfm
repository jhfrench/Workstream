
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
<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText#session.workstream_text_size#">
	<td align="center" class="RegText#session.workstream_text_size#">
		#attributes.month#/#attributes.year#
	</td>
	<td class="RegText#session.workstream_text_size#">
		#project_code#
	</td>
	<td class="RegText#session.workstream_text_size#">
		<cfset variables.StatusMsg=JSStringFormat(name)>
		<a href="javascript:list_to_emp('#emp_id#');" onmouseover="MM_displayStatusMsg('View details for #variables.StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#name#</a>
	</td>
	<td align="right" class="RegText#session.workstream_text_size#">
		<a href="javascript:list_to_emp('#emp_id#');" onmouseover="MM_displayStatusMsg('View details for #variables.StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#pin#</a>
	</td>
	<td align="right" class="RegText#session.workstream_text_size#">
		#decimalformat(rate)#
	</td>
	<td align="right" class="RegText#session.workstream_text_size#">
		<a href="javascript:emp_to_notes('#emp_id#|#attributes.project_id#','#attributes.drill_through#');" onmouseover="MM_displayStatusMsg('View notes from #variables.StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#decimalformat(hours)#</a><cfset variables.sum_hours=sum_hours+hours>
	</td>
	<td align="right" class="RegText#session.workstream_text_size#">
		#dollarformat(bill)#<cfset variables.sum_bill=sum_bill+bill>
	</td>
</tr>
</cfoutput>
<cfoutput>
<tr>
	<td align="right" colspan="5" class="SubHeadText#session.workstream_text_size#">Totals:<span class="RegText#session.workstream_text_size#"> #invoice_details.recordcount# Employee<cfif invoice_details.recordcount NEQ 1>s</cfif></span></td>
	<td align="right" class="RegText#session.workstream_text_size#">#decimalformat(variables.sum_hours)#</td>
	<td align="right" class="RegText#session.workstream_text_size#">#dollarformat(variables.sum_bill)#</td>
</tr>
</cfoutput>
