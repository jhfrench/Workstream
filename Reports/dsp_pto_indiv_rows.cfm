
<!--Reports/dsp_PTO_indiv_rows.cfm
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
<cfif get_individual_PTO.recordcount>
<cfoutput query="get_individual_PTO">
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
			<td><cfoutput>#remaining# (#decimalformat(remaining/8)# @ 8 hours per day)</cfoutput></td>
		</tr>
		<tr>
			<td colspan="4">&nbsp;</td>
		</tr>
