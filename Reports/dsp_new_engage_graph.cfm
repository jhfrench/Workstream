
<!--Reports/dsp_new_engage_graph.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display new engagements by customer and month.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
		Graph goes here<!--- 
<cfset temp_month=0>
<cfset temp_total=0>
<cfset variables.temp_year=0>
<cfset dataset0yvalue="">
<cfset dataset0Links="">
<cfset xAxisLabels="">
<cfoutput query="new_engage_output">
	<cfif month_entered NEQ temp_month AND variables.temp_year NEQ 0>
		<cfset dataset0yvalue=listprepend(dataset0yvalue,temp_total)>
		<cfset xAxisLabels=listprepend(xAxisLabels,Left(monthasstring(temp_month),1))>
		<cfif variables.temp_year NEQ year_entered><cfset xAxisLabels=listprepend(xAxisLabels,variables.temp_year, " ")></cfif>
		<cfset temp_total=0>
		<cfset dataset0Links=listprepend(dataset0Links,"index.cfm?fuseaction=convert&root_code=#root_code#")>
	</cfif>
		<cfset temp_total=temp_total+engagement_count>
		<cfset variables.temp_year=year_entered>
		<cfset temp_month=month_entered>
</cfoutput>
<cfset dataset0yvalue=listprepend(dataset0yvalue,temp_total)>
		<cfset dataset0Links=listprepend(dataset0Links,"index.cfm?fuseaction=convert&root_code=#root_code#")>
<cfset xAxisLabels=listprepend(xAxisLabels,Left(monthasstring(temp_month),1))>
<cfset xAxisLabels=listprepend(xAxisLabels,variables.temp_year, " ")>
<table align="center" border="0" cellpadding="1" cellspacing="0">
<cfoutput>
	<tr>
		<td align="center" class="SubHeadText">New Projects Over Time<span> (see bottom for selected customers)</span></td>
	</tr>
	<tr>
		<td align="center" class="SubHeadText">
			<applet code="javachart.applet.columnApp.class" codebase="#application.graphbase#" width="650" height="360">
				<param name="plotAreaColor" value="ffffff">
				<param name="backgroundColor" value="ffffff">
				<param name="2D" value="yes">
				<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">

				<param name="plotAreaTop" value=".94">
				<param name="plotAreaBottom" value=".1">
				<param name="plotAreaRight" value="1">
				<param name="plotAreaLeft" value=".05">

				<param name="xAxisLabels" value="#xAxisLabels#">
				<param name="xAxisLabelFont" value="Trebuchet MS,11,1">

				<param name="yAxisOptions" value="gridOn">
				<param name="yAxisColor" value="708090">
				<param name="yAxisLabelFont" value="Trebuchet MS,11,1">

				<param name="dataset0yValues" value="#dataset0yvalue#">
				<param name="dataset0name" value="Projects">
				<param name="dataset0Color" value="006666">
				<param name="dataset0LineWidth" value="2">
				<param name="dataset0Links" value="#dataset0Links#">

				<param name="legendllX" value=".01">
				<param name="legendllY" value=".95">
				<param name="legendOn" value="yes">
				<param name="iconWidth" value=".03">
				<param name="iconHeight" value=".01">
				<param name="legendLabelFont" value="Tahoma,11,1">
			</applet>
		</td>
	</tr>
	<tr>
		<td align="center" bgcolor="##a6a6a6" class="SubHeadText">
			Selected customers:
		</td>
	</tr>
	<tr>
		<td align="left"></cfoutput>
			<cfoutput query="selected_companies">&nbsp;&nbsp; #customer_name#<br /></cfoutput>
		</td>
	</tr>
</table>

 --->