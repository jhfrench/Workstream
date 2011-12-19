
<!--Reports/dsp_ts_client_count.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a bar graph showing the amount of time it takes to complete TS tasks for each product.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:09:27  stetzer
	<>

	Revision 1.0  2002-01-07 10:37:31-05  french
	Creating tech support report.

	||
	END FUSEDOC --->
<cfset variables.initial_color_list="FFC363,5A82B5,A5597B,6B7D63,E77963,5AA29C,CE5D63,428A6B,F7A263,9C9A5A,FF8E5A,7B96AD,528E84,BDCB94,A56163,4A8EAD,FFE784,4A6194,C6514A,A2835A,63E2E7,B55AB2,5AB55C,DDA0DD,000080,2E8B57,708090,7B68EE,000000,FF69B4,DC143C">
<cfset variables.color_list="">
<cfoutput query="ts_client_count">
<cfif currentrow LTE listlen(variables.initial_color_list)>
	<cfset variables.color_list=listappend(variables.color_list,listgetat(variables.initial_color_list,currentrow))>
<cfelse>
	<cfset variables.color_list=listappend(variables.color_list,randrange(100000,999999))>
</cfif>
</cfoutput>
</cfsilent>
<cfoutput>
		<applet code="javachart.applet.spinningPie.class" archive="javachart/jars/pie.jar, javachart/jars/base.jar" codebase="#request.dir_level##application.graphbase#" width="300" height="150">
			<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
			<param name="3D" value="true">
			<param name="pieWidth" value="1">
			<param name="pieHeight" value="1.3">
			<param name="xLoc" value=".5">
			<param name="yLoc" value=".6">
			<param name="startDegrees" value="90">
			
			<param name="dataset0yValues" value="#valuelist(ts_client_count.task_count)#">
			<param name="dataset0Labels" value="#valuelist(ts_client_count.customer)#">
	
			<param name="dataset0Colors" value="#variables.color_list#">
			<param name="labelFont" value="Trebuchet MS,9,1">
			<param name="labelPosition" value="2">
			
			<param name="dwellUseLabelString" value="true">
			<param name="dwellUseXValue" value="false">
			<param name="dwellUseYValue" value="true">
			<param name="dwellYString" value="(## tasks)">
		</applet>
</cfoutput>

