
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
	Revision 1.2  2005/06/15 12:44:53  stetzer
	<>

	Revision 1.1  2005-03-09 13:22:07-05  stetzer
	<>

	Revision 1.3  2001-10-18 16:17:40-04  french
	Made changes for custom field support.

	
 --->
</cfsilent>
	<tr align="left"><td colspan="3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">

<b>Data Operations Jobs:<br><cfoutput query="revenue_goal_dept"><a href="http://workstream.nucleusweb.com/index.cfm?fuseaction=Reports.sql_schedule&show_all=yes">#numberformat(revenue_progress,'___,___')#</a></cfoutput></b>
<!--- <b>New Revenue Progress:</b> --->
</td>
<td colspan="3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
<b>NRT Alerts:<br><cfoutput query="revenue_goal_dept2"><a href="http://workstream.nucleusweb.com/index.cfm?fuseaction=Reports.NRT_Report">#numberformat(revenue_progress,'___,___')#</a></cfoutput></b>
</td></tr>

<tr align="right"><td colspan="3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
	 <applet code="javachart.applet.speedoApp.class" codebase="../../../classes" width=125 height=65 align="middle">
<param name=CopyrightNotification value="JavaChart is a copyrighted work, and subject to full legal protection">
<param name=dataset0yValues value="<cfoutput query="revenue_goal_dept">#numberformat(revenue_progress,'_.__')#</cfoutput>,0,1.7">

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
<td colspan="3" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
	 <applet code="javachart.applet.speedoApp.class" codebase="../../../classes" width=125 height=65 align="middle">
<param name=CopyrightNotification value="JavaChart is a copyrighted work, and subject to full legal protection">
<param name=dataset0yValues value="<cfoutput query="revenue_goal_dept2">#numberformat(revenue_progress,'_.__')#</cfoutput>,0,1.7">
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
</td></tr> 




	