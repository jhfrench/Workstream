
<!--Reports/dsp_leader_hours.cfm
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
<cfparam name="variables.show_details_ind" default="1">
</cfsilent>
<table border="1" align="center" bordercolor="##000000" cellpadding="1" cellspacing="0">
	<tr bgcolor="##0000ff">
		<td align="center" height="27" colspan="<cfif variables.show_details_ind>4<cfelse>2</cfif>" class="HeadTextWhite">Summary of Hours by Client Code &amp; Employee</td>
	</tr>
	<tr bgcolor="#c0c0c0">
		<cfif variables.show_details_ind><td align="center" class="SubHeadText">Name</td>
		<td align="center" class="SubHeadText">Month</td></cfif>
		<td align="center" class="SubHeadText">Client Name</td>
		<td align="center" class="SubHeadText"><cfif variables.show_details_ind>Total </cfif>Hours</td>
	</tr>
<cfoutput query="Agg_hours_by_month">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<cfif variables.show_details_ind><td align="center">#name#</td>
		<td align="center">#month#/#year#</td></cfif>
		<td align="left">#clientname#</td>
		<td align="right">#decimalformat(sumofhours)#</td>
	</tr>
</cfoutput>
</table>
<br />&nbsp;
<br />
<table border="1" align="center" bordercolor="##000000" cellpadding="1" cellspacing="0">
	<tr bgcolor="##0000ff">
		<td align="center" height="27" colspan="3" class="HeadTextWhite">Summary of Hours by Week &amp; Employee</td>
	</tr>
	<tr bgcolor="#c0c0c0">
		<cfif variables.show_details_ind><td align="center" class="SubHeadText">Name</td></cfif>
		<td align="center" class="SubHeadText">Week</td>
		<td align="center" class="SubHeadText"><cfif variables.show_details_ind>Total </cfif>Hours</td>
	</tr>
<cfoutput query="Agg_hours_by_week">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<cfif variables.show_details_ind><td align="center">#name#</td></cfif>
		<td align="left"><cfif variables.show_details_ind>#month#/#year# </cfif>Week #week#</td>
		<td align="right">#decimalformat(sumofhours)#</td>
	</tr>
</cfoutput>
</table>

