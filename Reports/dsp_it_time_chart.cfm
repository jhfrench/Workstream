
<!--Reports/dsp_it_time_chart.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report chart (table).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:07:23  stetzer
	<>

	Revision 1.0  2001-11-08 10:01:45-05  french
	Creating IT Time report.

	||
	END FUSEDOC --->
<cfset lowest_year=year(now())>
<cfset temp_year=0>
</cfsilent>
<table border="0" cellpadding="1" cellspacing="0">
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td colspan="2" class="SubHeadText#session.workstream_text_size#"></td>
		<td align="center" colspan="2" class="SubHeadText#session.workstream_text_size#">IT Time</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText#session.workstream_text_size#">Year</td>
		<td class="SubHeadText#session.workstream_text_size#">Month</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Hours</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">%</td>
	</tr>
</cfoutput>
<cfoutput query="it_time_main">
<cfif time_year LT lowest_year><cfset lowest_year=time_year></cfif>
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td align="center" class="RegText#session.workstream_text_size#"><cfif time_year NEQ temp_year>#time_year#<cfset temp_year=time_year><cfelse>&nbsp;</cfif></td>
		<td align="left" class="RegText#session.workstream_text_size#"><a href="javascript:change_month('#time_month#','#time_year#');" class="RegText#session.workstream_text_size#">#MonthAsString(time_month)#</a></td>
		<td align="right" class="RegText#session.workstream_text_size#">#DecimalFormat(ap_time)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">#DecimalFormat(ap_percent)#</td>
	</tr>
</cfoutput>
</table>

