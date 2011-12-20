
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
			<td class="RegText">#dateformat(date, "mm/dd/yy")#</td>
			<td class="RegText">#hours#</td>
			<cfset remaining=remaining-hours>
			<td class="RegText">#remaining#</td>
		</tr>
		</cfoutput>
	<cfelse>
	<tr bgcolor="#FBEEA8">
		<td></td>
		<td class="RegText">-</td>
		<td class="RegText">No hours taken</td>
		<td class="RegText">-</td>
	</tr>
	</cfif>
	<tr bgcolor="#F9E36A">
		<td></td>
		<td colspan="2" class="RegText">Remaining:</td>
		
		<cfif IsNumeric(GetEmpDetails.day_length)>
			<cfset days_left=decimalformat(remaining/GetEmpDetails.day_length)>
		<cfelse>
			<cfset days_left=decimalformat(remaining/8)>  
		</cfif>
			<td class="RegText"><cfoutput>#remaining# (#days_left# <cfif  IsNumeric(GetEmpDetails.day_length)>#GetEmpDetails.day_length#-hour days<cfelse>8-hour days</cfif>)</cfoutput></td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
