
<!--Reports/dsp_pto_col_header.cfm
	Author: Jeromy F  -->
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
			<td colspan="2" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
				<cfoutput>#lname#, #name#</cfoutput>
			</td>
			<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Beginning hours: <cfoutput>#GetEmpDetails.Pto_Type_Indicator#</cfoutput></td>
			<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
				<cfoutput>#GetEmpDetails.company#</cfoutput>
			</td>
		</tr>
		<tr bgcolor="#FDF4C6">
			<td width="4%"></td>
			<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Date</td>
			<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Hours</td>
			<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Balance</td>
		</tr>
