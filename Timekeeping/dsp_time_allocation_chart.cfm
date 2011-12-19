
<!--Timekeeping/dsp_time_allocation_chart.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the time allocation chart that shows projects and time worked on those projects.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:22:12  stetzer
	<>

	Revision 1.2  2001-12-03 14:28:23-05  french
	Fixing divide by zero error.

	Revision 1.1  2001-10-11 10:55:02-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	Variables:
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	<-> variables.allocation_percent: number of hours spent on a particular project divided by the total number of hours worked during the same time range
	--> variables.temp_color_list: list of hexadecimal color values
	--> project_hours: number of hours spent on a particular project
	--> project_name: name of the project
	END FUSEDOC --->
</cfsilent>
	<tr>
		<td>
		</td>
<cfoutput>
		<td valign="top" width="30%" class="RegText#session.workstream_text_size#">
			#variables.work_allocation_first#
			<div align="center">#variables.work_allocation#</div>
		</td>
</cfoutput>
		<td valign="top">
		<cfif time_allocation_blurb.recordcount>
			<table bgcolor="#808080" cellpadding="0" cellspacing="1" border="0" width="100%">
				<tr bgcolor="#c0c0c0">
					<td bgcolor="#ffffff"></td>
					<td>&nbsp;&nbsp;</td>
<cfoutput>
					<td class="SubHeadText#session.workstream_text_size#">Engagement</td>
					<td class="SubHeadText#session.workstream_text_size#">Hours</td>
					<td class="SubHeadText#session.workstream_text_size#">Percent</td>
</cfoutput>
				</tr>
			<cfoutput query="time_allocation_blurb">
				<tr bgcolor="##<cfif (currentrow MOD 2)>E1E1E1<cfelse>ffffff</cfif>">
					<td bgcolor="##ffffff"></td>
					<td bgcolor="#listgetat(variables.temp_color_list,time_allocation_blurb.currentrow)#"></td>
					<td class="RegText#session.workstream_text_size#">#project_name#</td>
					<td align="right" class="RegText#session.workstream_text_size#">#DecimalFormat(project_hours)#</td>
					<td align="right" class="RegText#session.workstream_text_size#"><cfif variables.this_month NEQ 0><cfset variables.allocation_percent=project_hours/variables.this_month*100>#DecimalFormat(variables.allocation_percent)#<cfelse>0.00</cfif>%</td>
				</tr>
			</cfoutput>
			</table>
		</cfif>
		</td>
	</tr>

