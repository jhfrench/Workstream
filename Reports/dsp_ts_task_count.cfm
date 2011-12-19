
<!--Reports/dsp_ts_task_count.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I show, at a glance, statistics about currently unresolved tech support tasks. I also allow the user to drill-down to the task's details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr>
	<td colspan="7" align="center">
		<applet code="javachart.applet.labelLineApp.class" archive="javachart/jars/line.jar, javachart/jars/base.jar" codebase="#request.dir_level##application.graphbase#" width="990" height="180">
			<param name="backgroundColor" value="ffffff">
			<param name="2D" value="yes">
			<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
		
			<param name="plotAreaColor" value="ffffff">
			<param name="plotAreaTop" value=".95">
			<param name="plotAreaBottom" value=".2">
			<param name="plotAreaLeft" value=".1">
			<param name="plotAreaRight" value=".99">
			
			<param name="legendOff" value="true">
			
			<param name="dwellUseLabelString" value="true">
			<param name="dwellLabelsOn" value="true">
			<param name="dwellYString" value="## tasks">
			<param name="dwellUseYValue" value="true">
			<param name="dwellUseXValue" value="false">
			
			<param name="yAxisColor" value="#Y_TickBar#">
			<param name="yAxisGridColor" value="#Y_TickBar#">
			<param name="yAxisLabelColor" value="#X_label#">
			<param name="yAxisLabelFont" value="Trebuchet MS,#small#,1">
			<param name="yAxisLabelFormat" value="1">
			<param name="yAxisOptions" value="rotateTitle, gridOn, AutoScale">
			<param name="yAxisTickColor" value="#Y_TickBar#">
			<param name="yAxisTitle" value="Tasks">
			<param name="yAxisTitleColor" value="#X_label#">
			<param name="yAxisTitleFont" value="Trebuchet MS,#small#,1">
			
			<param name="xAxisColor" value="000000">
			<param name="xAxisGridColor" value="#X_label#">
			<param name="xAxisLabelColor" value="#X_label#">
			<param name="xAxisLabelFont" value="Trebuchet MS,#small#,1">
			<param name="xAxisLabels" value="#valuelist(ts_task_count.task_month)#">
			<param name="xAxisTickColor" value="#X_label#">
			<param name="xAxisTitle" value="Month">
			<param name="xAxisTitleFont" value="Trebuchet MS,#small#,1">
			
			<param name="barLabelColor" value="#X_label#">
			<param name="barLabelFormat" value="1">
			<param name="barLabelPrecision" value="4">
			
			<param name="dataset0LineWidth" value="2">
			<param name="dataset0color" value="5AA29C">
			<param name="dataset0yvalues" value="#valuelist(ts_task_count.task_count)#">
		</applet>
	</td>
</tr>
</cfoutput>
