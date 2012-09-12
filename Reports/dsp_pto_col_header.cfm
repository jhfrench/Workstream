
<!--Reports/dsp_pto_col_header.cfm
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
<tr bgcolor="#FEFAE0">
			<td colspan="2" class="SubHeadText">
				<cfoutput>#lname#, #name#</cfoutput>
			</td>
			<td class="SubHeadText">Beginning hours: <cfoutput>#get_pto_hours_report.Pto_Type_Indicator#</cfoutput></td>
			<td class="SubHeadText">
				<cfoutput>#get_pto_hours_report.company#</cfoutput>
			</td>
		</tr>
		<tr bgcolor="#FDF4C6">
			<td width="4%"></td>
			<td class="SubHeadText">Date</td>
			<td class="SubHeadText">Hours</td>
			<td class="SubHeadText">Balance</td>
		</tr>
