
<!--Reports/dsp_personal_summary_by_week_graph.cfm
	Author: Jeromy F  -->
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
</cfsilent>
<cfsavecontent variable="variables.chart_under_menu">
	<cfchart chartHeight="240" chartWidth="320" font="Trebuchet MS" fontsize="#variables.small#" fontBold="yes" show3D="yes" pieSliceStyle="solid" showLegend="no">
	    <cfchartseries type="bar" query="agg_hours_by_week" valueColumn="sumofhours" itemColumn="week" paintStyle="raise" seriescolor="5A82B5" seriesLabel="hours worked per week" />
	</cfchart>
</cfsavecontent>
<div id="personal_summary_by_week_graph">
     <cfoutput>#replacenocase(replacenocase(variables.chart_under_menu,'quality="high"', 'quality="high" wmode="transparent"', "ALL"),'<PARAM name="quality" value="high"/>', '<PARAM name="quality" value="high"/><PARAM name="wmode" value="transparent"/>', "ALL")#</cfoutput>
</div>
