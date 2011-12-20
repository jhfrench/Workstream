
<!--reports/dsp_overtime_totals.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I compute and display the total hours in the overtime report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
	<tr>
		<td colspan="2" class="RegTextIt">Total Hours:</td>
		<td class="RegTextIt"><cfoutput>#decimalformat(Total_Hours)#</cfoutput></td>
	</tr>

