
<!--Reports/dsp_PTO_indiv_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:08:57  stetzer
<>

Revision 1.1  2001-10-11 11:04:30-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

(KL | 8/13/01) Changed variable hours_per_day to day_length, to match with column returned from query
	 
	||
	END FUSEDOC --->
</cfsilent>
<cfif showhours.recordcount>
<cfoutput query="Showhours">
<tr bgcolor="##FBEEA8">
			<td></td>
			<td class="RegText#session.workstream_text_size#">#DateFormat(date, "mm/dd/yy")#</td>
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
