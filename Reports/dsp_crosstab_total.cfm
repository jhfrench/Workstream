
<!--Reports/dsp_crosstab_total.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the total rows for the crosstab report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:05:15  stetzer
	<>

	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<cfset variables.grandtotal=0>
</cfsilent>
	<tr bgcolor="#c0c0c0" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>Bd">
		<td>Total:</td>
		<!--- Set the Grand Total Varable to 0 and then Calculate the total hours spent --->
	<cfoutput query="manager_crosstab_codes">
		<cfset variables.grandtotal=manager_crosstab_codes.codetotal+variables.grandtotal>
		<td align="right">#decimalformat(codetotal)#</td> 
	</cfoutput>
		<td align="right"><cfoutput>#decimalformat(variables.grandtotal)#</cfoutput></td>
	</tr>

