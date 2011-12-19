
<!--Reports/dsp_new_engage_graph.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display new engagements by customer and month.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:08:13  stetzer
<>

Revision 1.1  2001-10-11 11:04:34-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
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
<cfset temp_month=0>
<cfset temp_total=0>
<cfset temp_year=0>
<cfset dataset0yvalue="">
<cfset dataset0Links="">
<cfset xAxisLabels="">
<cfoutput query="new_engage_output">
	<cfif month_entered NEQ temp_month AND temp_year NEQ 0>
		<cfset dataset0yvalue=listprepend(dataset0yvalue,temp_total)>
		<cfset xAxisLabels=listprepend(xAxisLabels,Left(MonthAsString(temp_month),1))>
		<cfif temp_year NEQ year_entered><cfset xAxisLabels=listprepend(xAxisLabels,temp_year, " ")></cfif>
		<cfset temp_total=0>
		<cfset dataset0Links=listprepend(dataset0Links,"index.cfm?fuseaction=convert&root_code=#root_code#")>
	</cfif>
		<cfset temp_total=temp_total+engagement_count>
		<cfset temp_year=year_entered>
		<cfset temp_month=month_entered>
</cfoutput>
<cfset dataset0yvalue=listprepend(dataset0yvalue,temp_total)>
		<cfset dataset0Links=listprepend(dataset0Links,"index.cfm?fuseaction=convert&root_code=#root_code#")>
<cfset xAxisLabels=listprepend(xAxisLabels,Left(MonthAsString(temp_month),1))>
<cfset xAxisLabels=listprepend(xAxisLabels,temp_year, " ")>
</cfsilent>
<table align="center" border="0" cellpadding="1" cellspacing="0">
<cfoutput>
	<tr>
		<td align="center" class="SubHeadText#session.workstream_text_size#">New Engagements Over Time<span class="RegText#session.workstream_text_size#"> (see bottom for selected customers)</span></td>
	</tr>
	<tr>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			<applet code="javachart.applet.columnApp.class" codebase="#request.dir_level##application.graphbase#" width="650" height="360">
				<param name="plotAreaColor" value="ffffff">
				<param name="backgroundColor" value="ffffff">
				<param name="2D" value="yes">
				<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
			
				<param name="plotAreaTop" value=".94">
				<param name="plotAreaBottom" value=".1">
				<param name="plotAreaRight" value="1">
				<param name="plotAreaLeft" value=".05">
				
				<param name="xAxisLabels" value="#xAxisLabels#">
				<param name="xAxisLabelFont" value="Trebuchet MS,#small#,1">
				
				<param name="yAxisOptions" value="gridOn">
				<param name="yAxisColor" value="708090">
				<param name="yAxisLabelFont" value="Trebuchet MS,#small#,1">
				
				<param name="dataset0yValues" value="#dataset0yvalue#">
				<param name="dataset0name" value="Engagements">
				<param name="dataset0Color" value="006666">
				<param name="dataset0LineWidth" value="2">
				<param name="dataset0Links" value="#dataset0Links#">
				
				<param name="legendllX" value=".01">
				<param name="legendllY" value=".95">
				<param name="legendOn" value="yes">
				<param name="iconWidth" value=".03">
				<param name="iconHeight" value=".01">
				<param name="legendLabelFont" value="Tahoma,#small#,1">
			</applet>
		</td>
	</tr>
	<tr>
		<td align="center" bgcolor="##a6a6a6" class="SubHeadText#session.workstream_text_size#">
			Selected customers:
		</td>
	</tr>
	<tr>
		<td align="left" class="RegText#session.workstream_text_size#"></cfoutput>
			<cfoutput query="selected_companies">&nbsp;&nbsp; #customer_name#<br></cfoutput>
		</td>
	</tr>
</table>

