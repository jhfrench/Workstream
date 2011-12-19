
<!--Reports/dsp_PTO_indiv_rows.cfm
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
<cfif showhours.recordcount>
<cfoutput query="Showhours">
<tr bgcolor="##FBEEA8">
			<td></td>
			<td class="RegText#session.workstream_text_size#">#dateformat(date, "mm/dd/yy")#</td>
			<td class="RegText#session.workstream_text_size#">#hours#</td>
			<cfset remaining=remaining-hours>
			<td class="RegText#session.workstream_text_size#">#remaining#</td>
		</tr>
		</cfoutput>
	<cfelse>
	<tr bgcolor="#FBEEA8">
		<td></td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">-</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">No hours taken</td>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">-</td>
	</tr>
	</cfif>
	<tr bgcolor="#F9E36A">
		<td></td>
		<td colspan="2" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Remaining:</td>
		
		<cfif IsNumeric(GetEmpDetails.day_length)>
			<cfset days_left=decimalformat(remaining/GetEmpDetails.day_length)>
		<cfelse>
			<cfset days_left=decimalformat(remaining/8)>  
		</cfif>
			<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"><cfoutput>#remaining# (#days_left# <cfif  IsNumeric(GetEmpDetails.day_length)>#GetEmpDetails.day_length#-hour days<cfelse>8-hour days</cfif>)</cfoutput></td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
