
<!--Reports/dsp_personal_summary_by_week_graph.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project and week.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfsavecontent variable="variables.chart_under_menu">
	<cfchart chartHeight="240" chartWidth="320" font="Trebuchet MS" fontsize="11" fontBold="yes" show3D="yes" showLegend="no" scaleTo="#get_employee_details.week_hours*1.8#">
		<cfchartseries type="bar" query="get_individual_hours_summary_by_week" valueColumn="hours_worked" itemColumn="work_week" paintStyle="raise" seriescolor="5A82B5" seriesLabel="hours worked per week" />
	</cfchart>
</cfsavecontent>
<div id="personal_summary_by_week_graph">
	<cfoutput>#replacenocase(replacenocase(variables.chart_under_menu,'quality="high"', 'quality="high" wmode="transparent"', "ALL"),'<PARAM name="quality" value="high" />', '<PARAM name="quality" value="high" /><PARAM name="wmode" value="transparent" />', "ALL")#</cfoutput>
</div>
