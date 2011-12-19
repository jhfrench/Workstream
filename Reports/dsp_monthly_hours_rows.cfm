
<!--Reports/dsp_monthly_hours_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the billable and non-billable montly hours reports.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<cfif NOT temp_cn IS ClientName>
		<cfset temp_cn=ClientName>
	</cfif> 
	<cfoutput>
		<tr class="RegText#session.workstream_text_size#">
			<td>#clientName# #ClientCode#</td>
			<td> #lname#, #name# </td>
			<td align="right"> #decimalformat(hours)# <cfset total_hours=total_hours+hours> </td>
		</tr></cfoutput>
		