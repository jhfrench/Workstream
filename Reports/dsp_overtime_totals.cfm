
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
	<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>It">
		<td colspan="2">Total Hours:</td>
<cfoutput>
		<td>#decimalformat(Total_Hours)#</td>
	</tr>
</cfoutput>