
<!--Timekeeping/dsp_revenue_progress.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the revenue line/area chart
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
 --->
</cfsilent>
<cfsavecontent variable="variables.chart_under_menu">
	<cfchart chartHeight="140" chartWidth="220" font="Trebuchet MS" fontsize="#variables.small#" fontBold="yes" show3D="yes" showLegend="no" seriesplacement="stacked">
	    <cfchartseries type="line" query="get_revenue_goal" valueColumn="revenue_goal" itemColumn="fiscal_year" dataLabelStyle="none" seriescolor="##5A9A00" />
		<cfchartseries type="bar" query="get_revenue_goal" valueColumn="hourly_revenue" itemColumn="fiscal_year" seriescolor="##005B9A" />
		<cfchartseries type="bar" query="get_revenue_goal" valueColumn="flat_revenue" itemColumn="fiscal_year" seriescolor="##0191C8" />
		<cfchartseries type="bar" query="get_revenue_goal" valueColumn="incident_revenue" itemColumn="fiscal_year" seriescolor="##74C2E1" />
	</cfchart>
</cfsavecontent>
<div id="revenue_progress">
     <cfoutput>#replacenocase(replacenocase(variables.chart_under_menu,'quality="high"', 'quality="high" wmode="transparent"', "ALL"),'<PARAM name="quality" value="high" />', '<PARAM name="quality" value="high" /><PARAM name="wmode" value="transparent" />', "ALL")#</cfoutput>
</div>