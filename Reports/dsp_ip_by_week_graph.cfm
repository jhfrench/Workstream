
<!--Reports/dsp_ip_by_week_graph.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display weekly implementation analysis data.
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
<cfset variables.initial_color_list="FFC363,5A82B5,A5597B,6B7D63,E77963,5AA29C,CE5D63,428A6B,F7A263,9C9A5A,FF8E5A,7B96AD,528E84,BDCB94,A56163,4A8EAD,FFE784,4A6194,C6514A,A2835A,63E2E7,B55AB2,5AB55C,DDA0DD,000080,2E8B57,708090,7B68EE,000000,FF69B4,DC143C">
<cfset variables.color_list="">
<cfoutput query="ip_by_product">
<cfif currentrow LTE listlen(variables.initial_color_list)>
	<cfset variables.color_list=listappend(variables.color_list,listgetat(variables.initial_color_list,currentrow))>
<cfelse>
	<cfset variables.color_list=listappend(variables.color_list,randrange(100000,999999))>
</cfif>
</cfoutput>
</cfsilent>
<cfoutput>
<tr bgcolor="C0C0C0">
	<td align="center" class="RegText#session.workstream_text_size#Bd">
		Implementations Per Week
	</td>
	<td align="center" class="RegText#session.workstream_text_size#Bd">
		Implementations per Product
	</td>
</tr>
<tr>
	<td align="center">
		<applet code="javachart.applet.labelLineApp.class" archive="javachart/jars/line.jar, javachart/jars/base.jar" codebase="#request.dir_level##application.graphbase#" width="400" height="150">
			<param name="backgroundColor" value="ffffff">
			<param name="2D" value="yes">
			<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
		
			<param name="plotAreaColor" value="ffffff">
			<param name="plotAreaTop" value=".95">
			<param name="plotAreaBottom" value=".2">
			<param name="plotAreaLeft" value=".1">
			<param name="plotAreaRight" value=".92">
			
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
			<param name="yAxisTitle" value="IPs">
			<param name="yAxisTitleColor" value="#X_label#">
			<param name="yAxisTitleFont" value="Trebuchet MS,#small#,1">
			
			<param name="xAxisColor" value="000000">
			<param name="xAxisGridColor" value="#X_label#">
			<param name="xAxisLabelColor" value="#X_label#">
			<param name="xAxisLabelFont" value="Trebuchet MS,#small#,1">
			<param name="xAxisLabels" value="#valuelist(ip_by_week.week_entered)#">
			<param name="xAxisTickColor" value="#X_label#">
			<param name="xAxisTitle" value="Week">
			<param name="xAxisTitleFont" value="Trebuchet MS,#small#,1">
			
			<param name="barLabelColor" value="#X_label#">
			<param name="barLabelFormat" value="1">
			<param name="barLabelPrecision" value="4">
			
			<param name="dataset0LineWidth" value="2">
			<param name="dataset0color" value="5A82B5">
			<param name="dataset0yvalues" value="#valuelist(ip_by_week.task_count)#">
		</applet>
	</td>
	<td align="center">
		<applet code="javachart.applet.spinningPie.class" archive="javachart/jars/pie.jar, javachart/jars/base.jar" codebase="#request.dir_level##application.graphbase#" width="300" height="150">
			<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
			<param name="3D" value="true">
			<param name="pieWidth" value="1">
			<param name="pieHeight" value="1.3">
			<param name="xLoc" value=".5">
			<param name="yLoc" value=".6">
			<param name="startDegrees" value="90">
			
			<param name="dataset0yValues" value="#valuelist(ip_by_product.ip_count)#">
			<param name="dataset0Labels" value="#valuelist(ip_by_product.product_name)#">
	
			<param name="dataset0Colors" value="#variables.color_list#">
			<param name="labelFont" value="Trebuchet MS,9,1">
			<param name="labelPosition" value="2">
			
			<param name="dwellUseLabelString" value="true">
			<param name="dwellUseXValue" value="false">
			<param name="dwellUseYValue" value="true">
			<param name="dwellYString" value="(## IPs)">
		</applet>
	</td>
</tr>
<tr bgcolor="C0C0C0">
	<td align="center" class="RegText#session.workstream_text_size#Bd">
		Average Number of Days to Complete an Implementation, by Week
	</td><!--- 
	<td align="center" class="RegText#session.workstream_text_size#Bd">&nbsp;</td> --->
</tr>
<tr>
	<td align="center">
		<applet code="javachart.applet.labelLineApp.class" archive="javachart/jars/line.jar, javachart/jars/base.jar" codebase="#request.dir_level##application.graphbase#" width="400" height="150">
			<param name="backgroundColor" value="ffffff">
			<param name="2D" value="yes">
			<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
		
			<param name="plotAreaColor" value="ffffff">
			<param name="plotAreaTop" value=".95">
			<param name="plotAreaBottom" value=".2">
			<param name="plotAreaLeft" value=".1">
			<param name="plotAreaRight" value=".92">
			
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
			<param name="yAxisTitle" value="Days">
			<param name="yAxisTitleColor" value="#X_label#">
			<param name="yAxisTitleFont" value="Trebuchet MS,#small#,1">
			
			<param name="xAxisColor" value="000000">
			<param name="xAxisGridColor" value="#X_label#">
			<param name="xAxisLabelColor" value="#X_label#">
			<param name="xAxisLabelFont" value="Trebuchet MS,#small#,1">
			<param name="xAxisLabels" value="#valuelist(ip_by_week.week_entered)#">
			<param name="xAxisTickColor" value="#X_label#">
			<param name="xAxisTitle" value="Week">
			<param name="xAxisTitleFont" value="Trebuchet MS,#small#,1">
			
			<param name="barLabelColor" value="#X_label#">
			<param name="barLabelFormat" value="1">
			<param name="barLabelPrecision" value="4">
			
			<param name="dataset0LineWidth" value="2">
			<param name="dataset0color" value="A5597B">
			<param name="dataset0yvalues" value="#valuelist(ip_by_week.days_to_complete)#">
		</applet>
	</td>
	<td>
		&nbsp;
	</td>
</tr>
</cfoutput>


