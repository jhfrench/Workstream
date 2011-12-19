
<!--Timekeeping/dsp_revenue_progress.cfm
	Author: Adam F -->
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
<!--- $issue$ someday change the revenue_progress to be a stacked bar chart of the revenue for the different billing types --->
<tr>
	<td colspan="2" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<cfsavecontent variable="variables.chart_under_menu">
			<cfchart chartHeight="140" chartWidth="220" font="Trebuchet MS" fontsize="#variables.small#" fontBold="yes" show3D="yes" pieSliceStyle="solid" showLegend="no">
			    <cfchartseries type="line" query="get_revenue_goal" valueColumn="revenue_goal" itemColumn="fiscal_year" dataLabelStyle="none" paintStyle="raise" />
			    <cfchartseries type="area" query="get_revenue_goal" valueColumn="revenue_progress" itemColumn="fiscal_year" dataLabelStyle="none" paintStyle="raise" />
			</cfchart>
		</cfsavecontent>
		<div id="revenue_progress">
		     <cfoutput>#replacenocase(replacenocase(variables.chart_under_menu,'quality="high"', 'quality="high" wmode="transparent"', "ALL"),'<PARAM NAME="quality" VALUE="high"/>', '<PARAM NAME="quality" VALUE="high"/><PARAM NAME="wmode" VALUE="transparent"/>', "ALL")#</cfoutput>
		</div>
	</td>
</tr> 




	