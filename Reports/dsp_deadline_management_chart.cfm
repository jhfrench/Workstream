
<!--Reports/dsp_deadline_management_chart.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Deadline Management Report chart (table).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:05:18  stetzer
	<>

	Revision 1.0  2001-11-08 09:14:48-05  french
	Adding deadline management report.

	||
	--> due_year: number containing a year
	--> due_month: number containing a month
	--> on_time_percent: decimal number that indicates the number of tasks in the given due_year and due_month that were completed on time or early.
	END FUSEDOC --->
<cfset lowest_year=year(now())>
<cfset temp_year=0>
</cfsilent>
<table border="0" cellpadding="1" cellspacing="0">
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td colspan="3" align="center" colspan="2" class="SubHeadText#session.workstream_text_size#">Tasks completed on time</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText#session.workstream_text_size#">Year</td>
		<td class="SubHeadText#session.workstream_text_size#">Month</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">%</td>
	</tr>
</cfoutput>
<cfoutput query="deadline_management_main">
<cfif due_year LT lowest_year><cfset lowest_year=due_year></cfif>
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td align="center" class="RegText#session.workstream_text_size#"><cfif due_year NEQ temp_year>#due_year#<cfset temp_year=due_year><cfelse>&nbsp;</cfif></td>
		<td align="left" class="RegText#session.workstream_text_size#"><a href="javascript:change_month('#due_month#','#due_year#');" class="RegText#session.workstream_text_size#">#MonthAsString(due_month)#</a></td>
		<td align="right" class="RegText#session.workstream_text_size#">#DecimalFormat(on_time_percent)#</td>
	</tr>
</cfoutput>
</table>

