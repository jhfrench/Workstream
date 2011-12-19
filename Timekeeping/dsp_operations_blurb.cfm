
<!--Timekeeping/act_pto_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:21:20  stetzer
<>

Revision 1.2  2002-01-02 09:47:21-05  french
Made corrections to last_month logic so that data is correct in January.

Revision 1.1  2001-10-11 10:55:18-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 (KL | 8/31/01) added the logic "And last_month NEQ 0" to the if statement to keep the divide by zero error from occuring.
	||
 --->
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset large="12">
		<cfset small="11">
		<cfset plotAreaLeft=63/100>
		<cfset graphheight=(operations_blurb.recordcount*15.5)+50>
	</cfcase>
	<cfcase value="Md">
		<cfset large="12">
		<cfset small="11">
		<cfset plotAreaLeft=63/100>
		<cfset graphheight=(operations_blurb.recordcount*13.95)+50>
	</cfcase>
	<cfdefaultcase>
		<cfset large="12">
		<cfset small="9">
		<cfset plotAreaLeft=63/100>
		<cfset graphheight=(operations_blurb.recordcount*13.1)+50>
	</cfdefaultcase>
</cfswitch>

<cfset xaxislabels="">
<cfset dataset0yvalues="">
<cfset dataset1yvalues="">
<cfset dataset2yvalues="">

<cfoutput query="operations_blurb">
	<cfset xaxislabels=listprepend(xaxislabels,description)>
	<cfset dataset0yvalues=listprepend(dataset0yvalues,(green/total))>
	<cfset dataset1yvalues=listprepend(dataset1yvalues,(yellow/total))>
	<cfset dataset2yvalues=listprepend(dataset2yvalues,(red/total))>
</cfoutput>
</cfsilent>


<cfoutput><applet code="javachart.applet.stackBarApp.class" codebase="#request.dir_level##application.graphbase#" width="300" height="#graphheight#">
	<param name="plotAreaColor" value="ffffff">
	<param name="backgroundColor" value="ffffff">
	<param name="2D" value="yes">
	<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">

	<param name="plotAreaTop" value="1.017">
	<param name="plotAreaBottom" value=".001">
	<param name="plotAreaRight" value=".999">
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
	<param name="xAxisLabelFont" value="Trebuchet MS,#small#,0">
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
	<param name="dwellUseYValue" value="false">
	
	<param name="dataset0yvalues" value="#dataset0yvalues#">
	<param name="dataset1yvalues" value="#dataset1yvalues#">
	<param name="dataset2yvalues" value="#dataset2yvalues#">
	<param name="dataset0Color" value="green">
	<param name="dataset0LabelColor" value="black">
	<param name="dataset0Name" value="Flat Rate">
	<param name="dataset1yURL" value="fake">
	<param name="dataset1LabelColor" value="black">
	<param name="dataset1Name" value="Hourly">
	<param name="dataset1Color" value="yellow">
	<param name="dataset2yURL" value="fake">
	<param name="dataset2LabelColor" value="black">
	<param name="dataset2Name" value="Per Incident">
	<param name="dataset2Color" value="red">
	
	<param name="legendOff" value="true">
	<param name="legendVertical" value="true">
	<param name="legendColor" value="ffffff">
	<param name="legendllX" value=".7">
	<param name="legendllY" value=".6">
	<param name="legendLabelFont" value="Trebuchet MS,#small#,1">
	<param name="legendLabelColor" value="black">
	<param name="iconWidth" value=".02">
	<param name="iconHeight" value=".02">
</applet></cfoutput>
