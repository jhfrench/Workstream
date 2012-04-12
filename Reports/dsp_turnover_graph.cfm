
<!--Reports/dsp_turnover_graph.cfm
	Author: Jeromy F-->
	<!--- FUSEDOC
	||
	Responsibilities: I display a column graph that represents the percentage incurred of each type of turnover for each of the quarters of each of the highlighted years.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfif evaluate("#query_name#.recordcount")>
<cfoutput>
	<tr>
		<td></td>
		<td colspan="#colspan#" class="SubHeadText">
			Turnover by Year, Quarter, and Category<br />
			<applet code="javachart.applet.columnApp.class" archive="javachart/jars/bar.jar, javachart/jars/base.jar" codebase="
#request.dir_level##application.graphbase#" width="850" height="300">
				<param name="backgroundColor" value="#background_color#">
				<param name="2D" value="yes">
				<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
			
				<param name="plotAreaColor" value="#graph_back#">
				<param name="plotAreaTop" value=".97">
				<param name="plotAreaBottom" value=".1">
				<param name="plotAreaLeft" value=".052">
				<param name="plotAreaRight" value=".97">
				
				<param name="legendOn" value="true">
				<param name="legendColor" value="white">
				<param name="legendLabelFont" value="Trebuchet MS,#small#,1">
				<param name="legendllY" value=".8">
				<param name="legendllX" value=".8">
				<param name="legendLabelColor" value="">
				<param name="legendVertical" value="true">
				<param name="inconheight" value=".01">
				<param name="iconwidth" value=".026">
				
				<param name="dwellUseLabelString" value="true">
				<param name="dwellLabelsOn" value="true">
				<param name="dwellYString" value="## Percent of Quarter Population">
				<param name="dwellUseYValue" value="true">
				<param name="dwellUseXValue" value="false">
				
				<param name="yAxisOptions" value="rotateTitle, gridOn">
				<param name="yAxisColor" value="#Y_TickBar#">
				<param name="yAxisGridColor" value="#Y_TickBar#">
				<param name="yAxisLabelColor" value="#X_label#">
				<param name="yAxisTickColor" value="#Y_TickBar#">
				<param name="yAxisTitleColor" value="#X_label#">
				<param name="yaxislabelformat" value="1">
				<param name="yAxisLabelFont" value="Arial,12,1">
				<param name="yAxisTitle" value="#yAxisTitle#">
				<param name="yAxisTitleFont" value="Arial,10,1">
				
				<param name="xAxisGridColor" value="#X_label#">
				<param name="xAxisTickColor" value="#X_label#">
				<param name="xAxisLabelColor" value="#X_label#">
				<param name="xAxisLabels" value="#xAxisLabels#">
				<param name="xAxisLabelFont" value="Trebuchet MS,#small#,1">
				
				<param name="barLabelColor" value="#X_label#">
				<param name="barLabelFormat" value="1">
				<param name="barLabelPrecision" value="4">
			<cfset counter=0>
			<cfloop list="#reasons#" index="ii">
				<param name="dataset#counter#yvalues" value="#evaluate("dataset#counter#")#">
				<param name="dataset#counter#LineWidth" value="2">
				<param name="dataset#counter#name" value="#ii#">
				<param name="dataset#counter#color" <cfset counter=incrementvalue(counter)>value="#listgetat(colors,counter)#">
			</cfloop>
			</applet>
		</td>
	</tr>
</cfoutput>
</cfif>

