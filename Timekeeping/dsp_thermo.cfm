
<!--Timekeeping/dsp_thermo.cfm
	Author: Adam F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the revenue thermo
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
 --->
</cfsilent>
<tr align="left">
	<td colspan="3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<b>New Revenue Progress:<br><cfoutput query="get_revenue_goal"><a href="index.cfm?fuseaction=Reports.sql_schedule&show_all=yes">#numberformat(revenue_progress,'___,___')#</a></cfoutput></b>
	<!--- <b>New Revenue Progress:</b> --->
	</td>
</tr>
<tr align="right">
	<td colspan="3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		 <applet code="javachart.applet.speedoApp.class" codebase="../../../classes" width=125 height=65 align="middle">
			<param name=CopyrightNotification value="JavaChart is a copyrighted work, and subject to full legal protection">
			<param name=dataset0yValues value="<cfoutput query="get_revenue_goal">#numberformat(revenue_progress,'_.__')#</cfoutput>,0,1.7">
		
			<param name=needleStyle value="3">
			<param name=labelsOutside value="true">
			<param name=labelsFont value="Arial,4,1">
			<param name=speedoPosition value="1">
			<param name=plotAreaColor value="white">
			<param name=backgroundColor value="white">
			<param name=yAxisOptions value="AutoScale,minTickOn,majTickOn,tickOn">
			<param name=yAxisTickLength value="3">
			<param name=yAxisTickColor value="white">
			<param name=yAxisLineColor value="gray">
			<param name=yAxisLabelColor value="black">
			<param name=yAxisLabelFont value="Arial,10,1">
		<!--- 	<param name=networkInterval value="5"> --->
		<!---THIS IS A REALLY BAD PARAM - Overrides your data<
		param name=dataset0yURL value="fake"> --->
			<param name=dataset0Color value="008080">
		</applet>
	</td>
</tr> 




	