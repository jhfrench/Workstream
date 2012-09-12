
<!--Reports/dsp_revenue_report_graph.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report graph.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset large="16">
		<cfset small="11">
		<cfset plotAreaLeft=12/100>
		<cfset variables.graph_height=(revenue_report.recordcount*15.5)+10>
	</cfcase>
	<cfcase value="Md">
		<cfset large="15">
		<cfset small="11">
		<cfset plotAreaLeft=11/100>
		<cfset variables.graph_height=(revenue_report.recordcount*13.95)+10>
	</cfcase>
	<cfdefaultcase>
		<cfset large="14">
		<cfset small="9">
		<cfset plotAreaLeft=10/100>
		<cfset variables.graph_height=(revenue_report.recordcount*13.1)+10>
	</cfdefaultcase>
</cfswitch>
<cfset xaxislabels="">
<cfset dataset0yvalues="">
<cfset dataset1yvalues="">
<cfset dataset2yvalues="">
<cfoutput query="revenue_report">
	<cfif month_revenue GT 0 OR (hour_revenue GT 0 OR flat_revenue GT 0 OR incident_revenue GT 0)>
	<cfif year NEQ variables.temp_year><cfset xaxislabels=listappend(xaxislabels,"--#year#--"," ")></cfif>
	<cfset xaxislabels=listprepend(xaxislabels,monthasstring(month))>
	<cfset dataset0yvalues=listprepend(dataset0yvalues,(flat_revenue/1000))>
	<cfset dataset1yvalues=listprepend(dataset1yvalues,(hour_revenue/1000))>
	<cfset dataset2yvalues=listprepend(dataset2yvalues,(incident_revenue/1000))>
	<cfset variables.temp_year=year>
	</cfif>
</cfoutput>
</cfsilent>
Sales By Billing Type<br />
<cfoutput><applet code="javachart.applet.stackBarApp.class" codebase="#application.graphbase#" width="600" height="#variables.graph_height#">
	<param name="plotAreaColor" value="ffffff">
	<param name="backgroundColor" value="ffffff">
	<param name="2D" value="yes">
	<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">

	<param name="plotAreaTop" value="1.017">
	<param name="plotAreaBottom" value=".03">
	<param name="plotAreaRight" value=".98">
	<param name="plotAreaLeft" value="#plotAreaLeft#">

	<param name="yAxisOptions" value="gridOn,minTickOn">
	<param name="yAxisGridColor" value="c0c0c0">
	<param name="yAxisLabelColor" value="black">
	<param name="yaxislabelformat" value="1">
	<param name="yAxisLabelFont" value="Trebuchet MS,#small#,1">
	<param name="yAxisLabelPrecision" value="1">
	<param name="yAxisTickColor" value="black">
	<param name="yAxisTitle" value="">
	<param name="yAxisTitleColor" value="black">
	<param name="yAxisTitleFont" value="Trebuchet MS,#large#,1">

	<param name="xAxisGridColor" value="black">
	<param name="xAxisLabelColor" value="black">
	<param name="xAxisLabelFont" value="Trebuchet MS,#small#,1">
	<param name="xAxisTickColor" value="black">
	<param name="xAxisTitle" value="Month">
	<param name="xAxisLabels" value="#xaxislabels#">
	<param name="xAxisTitleColor" value="black">
	<param name="xAxisTitleFont" value="Trebuchet MS,#large#,1">
	<param name="yAxisOptions" value="gridOn, tickOff">

	<param name="barLabelsOn" value="false">
	<param name="barLabelColor" value="black">
	<param name="barLabelFormat" value="1">
	<param name="barLabelPrecision" value="4">

	<param name="dwellUseXValue" value="false">
	<param name="dwellYString" value="$## (thousand)">

	<param name="dataset0yvalues" value="#dataset0yvalues#">
	<param name="dataset1yvalues" value="#dataset1yvalues#">
	<param name="dataset2yvalues" value="#dataset2yvalues#">
	<param name="dataset0Color" value="ff8c00">
	<param name="dataset0LabelColor" value="black">
	<param name="dataset0Name" value="Flat Rate">
	<param name="dataset1yURL" value="fake">
	<param name="dataset1LabelColor" value="black">
	<param name="dataset1Name" value="Hourly">
	<param name="dataset1Color" value="4682b4">
	<param name="dataset2yURL" value="fake">
	<param name="dataset2LabelColor" value="black">
	<param name="dataset2Name" value="Per Incident">
	<param name="dataset2Color" value="A5597B">

	<param name="legendOn" value="true">
	<param name="legendVertical" value="true">
	<param name="legendColor" value="ffffff">
	<param name="legendllX" value=".7">
	<param name="legendllY" value=".6">
	<param name="legendLabelFont" value="Trebuchet MS,#small#,1">
	<param name="legendLabelColor" value="black">
	<param name="iconWidth" value=".02">
	<param name="iconHeight" value=".02">
</applet></cfoutput>
<br />Sales ($1,000's)

