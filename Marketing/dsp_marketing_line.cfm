
<!--Marketing/dsp_marketing_form.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the display for the marketing Line graph for workstream.
	||
	Name: Adam Stezer
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfset temp_year=0>
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset large="16">
		<cfset small="11">
	</cfcase>
	<cfcase value="Md">
		<cfset large="15">
		<cfset small="11">
	</cfcase>
	<cfdefaultcase>
		<cfset large="14">
		<cfset small="9">
	</cfdefaultcase>
</cfswitch>
<cfset dataset0yvalues="">
<cfset dataset1yvalues="">
<cfset dataset2yvalues="">
<cfset dataset3yvalues="">
<cfset xaxislabels="">
</cfsilent>
<cfoutput query="get_marketing_line">
	<cfset label_ii=left(MonthAsString(month),3)>
	<cfif year NEQ temp_year>
		<cfset label_ii="#label_ii# #year#">
	</cfif>
	<cfset xaxislabels=listappend(xaxislabels,label_ii)>
	<cfset dataset0yvalues=ListAppend(dataset0yvalues, DecimalFormat(Prospect))>
	<cfset dataset1yvalues=ListAppend(dataset1yvalues, DecimalFormat(Qualify))>
	<cfset dataset2yvalues=ListAppend(dataset2yvalues, DecimalFormat(Propose))>
	<cfset dataset3yvalues=ListAppend(dataset3yvalues, DecimalFormat(Close))>
	<cfset temp_year=year>
</cfoutput>
<cfoutput>
<tr>
	<td>
	<applet code="javachart.applet.columnApp.class" codebase="#request.dir_level##application.graphbase#" width="840" height="360">
	<param name="plotAreaColor" value="ffffff">
	<param name="backgroundColor" value="ffffff">
	<param name="2D" value="yes">
	<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">

	<param name="plotAreaTop" value="1">
	<param name="plotAreaBottom" value="0.05">
	<param name="plotAreaRight" value="1">
	<param name="plotAreaLeft" value="0.05">
	
	<param name="xAxisLabels" value="#xaxislabels#">
	<param name="xAxisLabelFont" value="Trebuchet MS,#small#,1">
	<param name="xAxisOptions" value="rotateTitle">				
	<param name="yAxisOptions" value="rotateTitle, gridOn">
	<param name="yAxisColor" value="708090">
	<param name="yAxisLabelFont" value="Trebuchet MS,#small#,1">
	
	<param name="dataset0yValues" value="#dataset0yvalues#">
	<param name="dataset1yValues" value="#dataset1yvalues#">
	<param name="dataset2yValues" value="#dataset2yvalues#">
	<param name="dataset3yValues" value="#dataset3yvalues#"> 
	
	<param name="dataset0name" value="Prospecting">
	<param name="dataset1name" value="Qualifying">
	<param name="dataset2name" value="Proposing">
	<param name="dataset3name" value="Closing">
	<param name="dataset0Color" value="FFC363">
	<param name="dataset1Color" value="5A82B5">
	<param name="dataset2Color" value="A5597B">
	<param name="dataset3Color" value="6B7D63">		
	
	<param name="legendllX" value=".7">
	<param name="legendllY" value=".7"> 
	<param name="legendOn" value="yes">
	<param name="iconWidth" value=".03">
	<param name="iconHeight" value=".02">
	<param name="legendLabelFont" value="Tahoma,#small#,0">
</applet>
</cfoutput>
	</td>
</tr>

