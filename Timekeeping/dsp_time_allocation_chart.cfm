
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
	||
	Variables:
	<-> variables.allocation_percent: number of hours spent on a particular project divided by the total number of hours worked during the same time range
	--> variables.color_list: list of hexadecimal color values
	--> project_hours: number of hours spent on a particular project
	--> project_name: name of the project
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="3" section_color="78A0EB" section_title="Work Allocation" title_class="HeadTextWhite">
	<tr>
		<td>
		</td>
		<cfif time_allocation_blurb.recordcount>
		<td valign="top" width="30%" class="RegText">
			#variables.work_allocation_text#
			<cfsavecontent variable="variables.chart_under_menu">
				<cfchart chartHeight="150" chartWidth="300" font="Trebuchet MS" fontsize="#variables.small#" fontBold="yes" show3D="yes" pieSliceStyle="solid" showLegend="no">
				    <cfchartseries type="pie" query="time_allocation_blurb" valueColumn="project_hours" itemColumn="project_name" colorlist="#variables.color_list#" dataLabelStyle="none" paintStyle="raise" />
				</cfchart>
			</cfsavecontent>
			<div id="time_allocation_chart" align="center">
			     <cfoutput>#replacenocase(replacenocase(variables.chart_under_menu,'quality="high"', 'quality="high" wmode="transparent"', "ALL"),'<PARAM name="quality" value="high"/>', '<PARAM name="quality" value="high"/><PARAM name="wmode" value="transparent"/>', "ALL")#</cfoutput>
			Hover over a pie slice to see details.
			</div>
		</td>
		<td valign="top">
			<table cellpadding="1" cellspacing="0" border="0" width="100%">
				<tr bgcolor="##c0c0c0">
					<td bgcolor="##ffffff">&nbsp;</td>
					<td>&nbsp;&nbsp;</td>
					<td class="SubHeadText">Project</td>
					<td class="SubHeadText">Hours</td>
					<td class="SubHeadText">Percent</td>
				</tr>
			<cfloop query="time_allocation_blurb">
				<tr bgcolor="##<cfif (currentrow MOD 2)>E1E1E1<cfelse>ffffff</cfif>">
					<td bgcolor="##ffffff">&nbsp;</td>
					<td bgcolor="#listgetat(variables.color_list,time_allocation_blurb.currentrow)#">&nbsp;</td>
					<td class="RegText">#project_name#</td>
					<td align="right" class="RegText">#decimalformat(project_hours)#</td>
					<td align="right" class="RegText"><cfif variables.this_month NEQ 0><cfset variables.allocation_percent=project_hours/variables.this_month*100>#decimalformat(variables.allocation_percent)#<cfelse>0.00</cfif>%</td>
				</tr>
			</cfloop>
			</table>
		<cfelse>
		<td valign="top" colspan="2" width="100%" class="RegText">
			You have not yet entered any time for #monthasstring(month(now()))#.
		</cfif>
		</td>
	</tr>
</table>
</cfoutput>