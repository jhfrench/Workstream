
<!--Reports/dsp_indiv_row_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the row headers for the individual hours report and the manager individual hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="SubHeadTextWhite">
			Full Name: <cfif IsDefined ("name.last_name")>#name.last_name#, #name.name#<cfelse>#last_name#, #first_name#</cfif>
		</td>
		<td colspan="2" class="SubHeadTextWhite">
			Company: <cfif IsDefined ("name.last_name")>#name.company#<cfelse>#company_name#</cfif>
		</td>
	</tr>
</cfoutput>
