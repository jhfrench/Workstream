
<!--Reports/dsp_hours_code_totals.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the totals for the hours code report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
	<tr class="RegTextIt">
		<td width="25">&nbsp;&nbsp;</td>
		<td width="25">&nbsp;&nbsp;</td>
		<td> Grand Total:</td>
		<td><cfoutput> #decimalformat(total_hours)#</cfoutput></td>
		<td width="25">&nbsp;&nbsp;</td>
	</tr>
<cfset total_hours = 0>
