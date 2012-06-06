
<!--Reports/dsp_personal_summary_by_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<table border="0" cellpadding="2" cellspacing="0">
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td colspan="<cfif variables.show_details_ind>3<cfelse>2</cfif>" class="SubHeadTextWhite">
			Summary of Hours by Client Code &amp; Employee
		</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="RegTextBd">Client Name</td>
		<td class="RegTextBd"><cfif variables.show_details_ind>Total </cfif>Hours</td>
	</tr>
</cfoutput>
<cfoutput query="Agg_hours_by_month">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td align="left">#clientname#</td>
		<td align="right">#decimalformat(sumofhours)#</td>
	</tr>
</cfoutput>
</table>

