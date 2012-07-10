
<!--Reports/dsp_gross_hours_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the gross hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput query="gross_hours">	
	<tr>
		<td>#name#</td><cfloop from="1" to="#variables.daysinmonth#" index="ii">
		<td class="number">#decimalformat(evaluate("day#ii#"))#</td></cfloop>
		<td class="number">#decimalformat(total)#</td>
	</tr>
</cfoutput>

