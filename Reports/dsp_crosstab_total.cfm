
<!--Reports/dsp_crosstab_total.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the total rows for the crosstab report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.grandtotal=0>
</cfsilent>
	<tr bgcolor="#c0c0c0" class="RegTextBd">
		<td>Total:</td>
		<!--- Set the Grand Total Varable to 0 and then Calculate the total hours spent --->
	<cfoutput query="manager_crosstab_codes">
		<cfset variables.grandtotal=manager_crosstab_codes.codetotal+variables.grandtotal>
		<td align="right">#decimalformat(codetotal)#</td> 
	</cfoutput>
		<td align="right"><cfoutput>#decimalformat(variables.grandtotal)#</cfoutput></td>
	</tr>

