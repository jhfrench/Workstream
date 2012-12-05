
<!--Reports/dsp_monthly_hours_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the billable and non-billable montly hours reports.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
	<cfif comparenocase(variables.temp_client_name, ClientName)>
		<cfset variables.temp_client_name=ClientName>
	</cfif> 
	<cfoutput>
		<tr>
			<td>#clientName# #ClientCode#</td>
			<td> #last_name#, #first_name# </td>
			<td align="right"> #decimalformat(hours)# <cfset total_hours=total_hours+hours> </td>
		</tr></cfoutput>
		