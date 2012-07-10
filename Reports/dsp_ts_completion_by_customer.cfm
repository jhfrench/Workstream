
<!--Reports/dsp_ts_completion_by_customer.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a bar graph showing the amount of time it takes to complete TS tasks for each session.workstream_
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset Y_TickBar="708090">
<cfset X_label="000000">
<cfset xAxisLabels="">
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
<cfoutput>
<applet code="javachart.applet.columnApp.class" archive="javachart/jars/line.jar, javachart/jars/base.jar" codebase="#request.dir_level##application.graphbase#" width="500" height="300">
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
				<param name="yAxisLabelFont" value="Trebuchet MS,#small#,1">
				<param name="yAxisTitle" value="Hours">
				<param name="yAxisTitleFont" value="Trebuchet MS,#small#,1">
				
				<param name="xAxisGridColor" value="#X_label#">
				<param name="xAxisColor" value="000000">
				<param name="xAxisTickColor" value="#X_label#">
				<param name="xAxisLabelColor" value="#X_label#">
				<param name="xAxisLabelAngle" value="90">
				<param name="xAxisLabelFont" value="Trebuchet MS,#small#,1">
				<param name="xAxisTitle" value="Customer">
				<param name="xAxisTitleFont" value="Trebuchet MS,#small#,1">
				
				<param name="barLabelColor" value="#X_label#">
				<param name="barLabelFormat" value="1">
				<param name="barLabelPrecision" value="4">
				<param name="dataset0LineWidth" value="2">
				
				<param name="dataset0color" value="5A82B5">
				<param name="dataset0yvalues" value="#valuelist(ts_completion_by_customer.avg_hours)#">
				<param name="dataset0labels" value="#valuelist(ts_completion_by_customer.description)#">
				</cfoutput>
			</applet>

