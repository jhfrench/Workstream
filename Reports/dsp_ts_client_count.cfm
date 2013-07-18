
<!--Reports/dsp_ts_client_count.cfm
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
<cfloop query="get_tech_support_client_count">
<cfif currentrow GT listlen(variables.initial_color_list)>
	<cfset application.application_specific_settings.color_list=listappend(application.application_specific_settings.color_list,randrange(100000,999999))>
</cfif>
</cfloop>
</cfsilent>
<cfoutput>
		<applet code="javachart.applet.spinningPie.class" archive="javachart/jars/pie.jar, javachart/jars/base.jar" codebase="#application.graphbase#" width="300" height="150">
			<param name="CopyrightNotification" value="JavaChart is a copyrighted work, and subject to full legal protection">
			<param name="3D" value="true">
			<param name="pieWidth" value="1">
			<param name="pieHeight" value="1.3">
			<param name="xLoc" value=".5">
			<param name="yLoc" value=".6">
			<param name="startDegrees" value="90">

			<param name="dataset0yValues" value="#valuelist(get_tech_support_client_count.task_count)#">
			<param name="dataset0Labels" value="#valuelist(get_tech_support_client_count.customer)#">

			<param name="dataset0Colors" value="#application.application_specific_settings.color_list#">
			<param name="labelFont" value="Trebuchet MS,9,1">
			<param name="labelPosition" value="2">

			<param name="dwellUseLabelString" value="true">
			<param name="dwellUseXValue" value="false">
			<param name="dwellUseYValue" value="true">
			<param name="dwellYString" value="(## tasks)">
		</applet>
</cfoutput>

