
<!--Reports/dsp_tech_support_completion_by_product.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a bar graph showing the amount of time it takes to complete TS tasks for each product.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<!--- $issue$: put new graph here
<cfoutput>
<applet code="javachart.applet.columnApp.class" archive="javachart/jars/line.jar, javachart/jars/base.jar" codebase="#application.graphbase#" width="500" height="300">
				<param name="backgroundColor" value="ffffff">
				<param name="2D" value="yes">
				<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">

				<param name="plotAreaColor" value="ffffff">
				<param name="plotAreaTop" value=".95">
				<param name="plotAreaBottom" value=".2">
				<param name="plotAreaLeft" value=".1">
				<param name="plotAreaRight" value="1">

				<param name="legendOff" value="true">

				<param name="dwellUseLabelString" value="true">
				<param name="dwellLabelsOn" value="true">
				<param name="dwellYString" value="## hours worked">
				<param name="dwellUseYValue" value="true">
				<param name="dwellUseXValue" value="false">
				<!---
				<param name="yAxisOptions" value="rotateTitle, gridOn, noAutoScale">
				<param name="yAxisStart" value="0">
				<param name="yAxisEnd" value="90"> --->
				<param name="yAxisColor" value="#Y_TickBar#">
				<param name="yAxisGridColor" value="#Y_TickBar#">
				<param name="yAxisLabelColor" value="#X_label#">
				<param name="yAxisTickColor" value="#Y_TickBar#">
				<param name="yAxisTitleColor" value="#X_label#">
				<param name="yaxislabelformat" value="1">
				<param name="yAxisLabelFont" value="Trebuchet MS,11,1">
				<param name="yAxisTitle" value="Hours">
				<param name="yAxisTitleFont" value="Trebuchet MS,11,1">

				<param name="xAxisGridColor" value="#X_label#">
				<param name="xAxisColor" value="000000">
				<param name="xAxisTickColor" value="#X_label#">
				<param name="xAxisLabelColor" value="#X_label#">
				<param name="xAxisLabelFont" value="Trebuchet MS,11,1">
				<param name="xAxisLabelAngle" value="90">
				<param name="xAxisTitle" value="Product">
				<param name="xAxisTitleFont" value="Trebuchet MS,11,1">

				<param name="barLabelColor" value="#X_label#">
				<param name="barLabelFormat" value="1">
				<param name="barLabelPrecision" value="4">
				<param name="dataset0LineWidth" value="2">

				<param name="dataset0color" value="5A82B5">
				<param name="dataset0yvalues" value="#valuelist(get_tech_support_completion_by_product.avg_hours)#">
				<param name="dataset0labels" value="#valuelist(get_tech_support_completion_by_product.product_name)#">
				</cfoutput>
			</applet> --->

