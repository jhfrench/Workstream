
<!--Reports/dsp_it_time_chart.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report chart (table).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset lowest_year=year(now())>
<cfset temp_year=0>
</cfsilent>
<table border="0" cellpadding="1" cellspacing="0">
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td colspan="2" class="SubHeadText"></td>
		<td align="center" colspan="2" class="SubHeadText">IT Time</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText">Year</td>
		<td class="SubHeadText">Month</td>
		<td align="center" class="SubHeadText">Hours</td>
		<td align="center" class="SubHeadText">%</td>
	</tr>
</cfoutput>
<cfoutput query="it_time_main">
<cfif time_year LT lowest_year><cfset lowest_year=time_year></cfif>
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td align="center"><cfif time_year NEQ temp_year>#time_year#<cfset temp_year=time_year><cfelse>&nbsp;</cfif></td>
		<td align="left"><a href="javascript:change_month('#time_month#','#time_year#');">#MonthAsString(time_month)#</a></td>
		<td align="right">#decimalformat(ap_time)#</td>
		<td align="right">#decimalformat(ap_percent)#</td>
	</tr>
</cfoutput>
</table>

