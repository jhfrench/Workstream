
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
			<td>#dateformat(date, "mm/dd/yyyy")#</td>
			<td>#hours#</td>
			<cfset remaining=remaining-hours>
			<td>#remaining#</td>
		</tr>
		</cfoutput>
	<cfelse>
	<tr bgcolor="#FBEEA8">
		<td></td>
		<td>-</td>
		<td>No hours taken</td>
		<td>-</td>
	</tr>
	</cfif>
	<tr bgcolor="#F9E36A">
		<td></td>
		<td colspan="2">Remaining:</td>

		<cfif IsNumeric(GetEmpDetails.day_length)>
			<cfset days_left=decimalformat(remaining/GetEmpDetails.day_length)>
		<cfelse>
			<cfset days_left=decimalformat(remaining/8)>  
		</cfif>
			<td><cfoutput>#remaining# (#days_left# <cfif  IsNumeric(GetEmpDetails.day_length)>#GetEmpDetails.day_length#-hour days<cfelse>8-hour days</cfif>)</cfoutput></td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
