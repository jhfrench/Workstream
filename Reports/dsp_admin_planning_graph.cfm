
<!--Reports/dsp_admin_planning_graph.cfm
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
<cfset variables.temp_year=0>
<cfset plotAreaLeft=11/100>
<cfset graphheight=(admin_planning_main.recordcount*19.25)+10>
<cfset xaxislabels="">
<cfset dataset0yvalues="">
<cfset dataset1yvalues="">
<cfset dataset2yvalues="">
<cfoutput query="admin_planning_main">
<cfif variables.temp_year NEQ time_year>
	<cfset temp_variable="#time_year# #left(monthasstring(time_month),3)#">
	<cfset variables.temp_year=time_year>
<cfelse>
	<cfset temp_variable="#left(monthasstring(time_month),3)#">
</cfif>
	<cfset xaxislabels=listprepend(xaxislabels,temp_variable)>
	<cfset dataset0yvalues=listprepend(dataset0yvalues,(ap_percent))>
</cfoutput>
</cfsilent>
Admin/Planning Efficiency Percent<br />
<cfoutput>
<!--- $issue$: put new graph here
<applet code="javachart.applet.stackBarApp.class" codebase="#application.graphbase#" width="600" height="#graphheight#">
	<param name="plotAreaColor" value="ffffff">
	<param name="backgroundColor" value="ffffff">
	<param name="2D" value="yes">
	<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">

	<param name="plotAreaTop" value="1.017">
	<param name="plotAreaBottom" value=".055">
	<param name="plotAreaRight" value=".98">
	<param name="plotAreaLeft" value="#plotAreaLeft#">

	<param name="yAxisOptions" value="gridOn,minTickOn">
	<param name="yAxisGridColor" value="c0c0c0">
	<param name="yAxisLabelColor" value="black">
	<param name="yaxislabelformat" value="1">
	<param name="yAxisLabelFont" value="Trebuchet MS,11,1">
	<param name="yAxisLabelPrecision" value="1">
	<param name="yAxisTickColor" value="black">
	<param name="yAxisTitle" value="">
	<param name="yAxisTitleColor" value="black">
	<param name="yAxisTitleFont" value="Trebuchet MS,15,1">

	<param name="xAxisGridColor" value="black">
	<param name="xAxisLabelColor" value="black">
	<param name="xAxisLabelFont" value="Trebuchet MS,11,1">
	<param name="xAxisTickColor" value="black">
	<param name="xAxisTitle" value="Month">
	<param name="xAxisLabels" value="#xaxislabels#">
	<param name="xAxisTitleColor" value="black">
	<param name="xAxisTitleFont" value="Trebuchet MS,15,1">
	<param name="yAxisOptions" value="gridOn, tickOff">

	<param name="barLabelsOn" value="false">
	<param name="barLabelColor" value="black">
	<param name="barLabelFormat" value="1">
	<param name="barLabelPrecision" value="4">

	<param name="dwellUseXValue" value="false">
	<param name="dwellYString" value="##%">

	<param name="dataset0yvalues" value="#dataset0yvalues#">
	<param name="dataset0Color" value="4682b4">
	<param name="dataset0LabelColor" value="black">
	<param name="dataset0Name" value="Percent of Admin/Planning time">

	<param name="legendOff" value="true">
	<param name="legendVertical" value="true">
	<param name="legendColor" value="ffffff">
	<param name="legendllX" value=".6">
	<param name="legendllY" value=".5">
	<param name="legendLabelFont" value="Trebuchet MS,11,1">
	<param name="legendLabelColor" value="black">
	<param name="iconWidth" value=".02">
	<param name="iconHeight" value=".02">
</applet> --->
<br />Percent of Admin/Planning time</cfoutput>

