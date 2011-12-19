
<!--Marketing/dsp_marketing_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the display for the marketing home for workstream.
	||
	Name: Adam Stezer
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset small="11">
	</cfcase>
	<cfcase value="Md">
		<cfset small="11">
	</cfcase>
	<cfdefaultcase>
		<cfset small="9">
	</cfdefaultcase>
</cfswitch>
<cfset Last_Month = DatePart("m",(dateadd("m",-1, now())))>
<cfset This_Year = DatePart("yyyy",(dateadd("m",0, now())))>	
<cfset ytd_revenue=0>
<cfoutput query="revenue_report">
<cfif year eq This_Year>
	<cfset ytd_revenue=ytd_revenue+month_revenue>
</cfif>
</cfoutput>
<cfset variables.marketing_text='Last month (#MonthAsString(prospects.nice_month)#), <span class="RegText#session.workstream_text_size#Bd">#prospects.prospects# new suspects</span> were brought into the funnel. This month (#MonthAsString(prospects_this_month.nice_month)#), <span class="RegText#session.workstream_text_size#Bd">#prospects_this_month.prospects_this_month# new suspects</span> have been identified. The monthly goal for suspects is xx (Coming Soon). <a href="#request.dir_level#index.cfm?fuseaction=Reports.new_engagement_output&root_code=6005" class="RegText#session.workstream_text_size#">Click here to view the engagement report for new suspects by month.</a>'>

<cfset ytd_revenue_millions=ytd_revenue/1000000>
<cfset variables.sales_text='The current closure rate for qualified prospects is xx% (Coming Soon). The goal for 2001 is to close xx% (Coming Soon) of all Qualified Prospects that are brought into the funnel by Marketing. <a href="#request.dir_level#index.cfm?fuseaction=Reports.sales_report" class="RegText#session.workstream_text_size#">Click here for sales details.</a>'>
</cfsilent>
	<tr valign="top">		
		<td width="10%" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">&nbsp;</td>
		<td width="30%">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<cfmodule template="#request.dir_level#common_files/dsp_section_title.cfm" colspan="3" section_color="008080" section_title="Marketing" title_class="HeadText#session.workstream_text_size#White">
				<cfmodule template="#request.dir_level#common_files/dsp_section_text.cfm" colspan="3" section_color="ffffff" section_text="#variables.marketing_text#" title_class="RegText#session.workstream_text_size#">
				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<cfmodule template="#request.dir_level#common_files/dsp_section_title.cfm" colspan="3" section_color="008580" section_title="Funnel Durations" title_class="HeadText#session.workstream_text_size#White">
				<cfoutput>
				<tr>
					<td></td>
					<td class="RegText#session.workstream_text_size#Bd" colspan="2">Average Duration (in days)
					</td>
				</tr>
				<tr>
					<td></td>
					<td bgcolor="##E1E1E1" class="RegText#session.workstream_text_size#">&nbsp;Prospecting</td>
					<td bgcolor="##E1E1E1" class="RegText#session.workstream_text_size#">
						#marketing_duration.prospecting_dur#
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="RegText#session.workstream_text_size#">&nbsp;Qualifying</td>
					<td class="RegText#session.workstream_text_size#">
						#marketing_duration.qualifying_dur#
					</td>
				</tr>
				<tr>
					<td></td>
					<td bgcolor="##E1E1E1" class="RegText#session.workstream_text_size#">&nbsp;Proposing</td>
					<td bgcolor="##E1E1E1" class="RegText#session.workstream_text_size#">
						#marketing_duration.proposing_dur#
					</td>
				</tr>
				<tr>
					<td></td>
					<td class="RegText#session.workstream_text_size#">&nbsp;Closing</td>
					<td class="RegText#session.workstream_text_size#">
						#marketing_duration.closing_dur#
					</td>
				</tr>
				</cfoutput>
			</table>
		</td>
		<td width="30%">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<cfmodule template="#request.dir_level#common_files/dsp_section_title.cfm" colspan="3" section_color="0000ff" section_title="Sales" title_class="HeadText#session.workstream_text_size#White">
				<cfmodule template="#request.dir_level#common_files/dsp_section_text.cfm" colspan="3" section_color="ffffff" section_text="#variables.sales_text#" title_class="RegText#session.workstream_text_size#">
				<tr>
					<td valign="top" width="1%">&nbsp;</td>
					<cfoutput><td valign="top" width="39%" class="RegText#session.workstream_text_size#">
						<span class="RegText#session.workstream_text_size#Bd">Total sales for Nucleus YTD has been #dollarformat(ytd_revenue)#.</span> The goal for #Year(now())# is <cfif get_revenue_goal.revenue_goal>#dollarformat(get_revenue_goal.revenue_goal)#<cfelse>Unknown</cfif>.
					</td>
					<td valign="top" align="center" width="60%" class="RegText#session.workstream_text_size#">
						<applet code="javachart.applet.speedoApp.class" codebase="#request.dir_level##application.graphbase#" width="200" height="100">
						<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
						<param name="dataset0yValues" value="#numberformat(ytd_revenue_millions,'_____._')#,0,8">
							<param name="needleStyle" value="3">
							<param name="labelsOutside" value="true">
							<param name="labelsFont" value="Trebuchet MS,#small#,1">
							<param name="speedoPosition" value="1">
							<param name="plotAreaColor" value="ffffff">
							<param name="backgroundColor" value="ffffff">
							<param name="yAxisOptions" value="AutoScale,minTickOn,majTickOn,tickOn">
							<param name="yAxisOptions" value="gridOn">
							<param name="yAxisColor" value="708090">
							<param name="yAxisTickLength" value="3">
							<param name="yAxisTickColor" value="c9c9c9">
							<param name="yAxisLineColor" value="708090">
							<param name="yAxisLabelColor" value="708090">
							<param name="dataset0Color" value="cc6633">
						</applet><br>YTD Sales Meter
					</td>
				</tr>
				</cfoutput>
			</table>
		</td>
		<td width="30%">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<cfmodule template="#request.dir_level#common_files/dsp_section_title.cfm" colspan="3" section_color="800000" section_title="Current #listlast(session.workstream_company_name)# Funnel" title_class="HeadText#session.workstream_text_size#White">
				<tr>
					<td></td>
					<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
						<cfinclude template="funnel_grid.cfm">
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
