
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
	||
 --->
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset large="12">
		<cfset small="11">
		<cfset plotAreaLeft=63/100>
		<cfset variables.graph_height=(operations_blurb.recordcount*15.5)+50>
	</cfcase>
	<cfcase value="Md">
		<cfset large="12">
		<cfset small="11">
		<cfset plotAreaLeft=63/100>
		<cfset variables.graph_height=(operations_blurb.recordcount*13.95)+50>
	</cfcase>
	<cfdefaultcase>
		<cfset large="12">
		<cfset small="9">
		<cfset plotAreaLeft=63/100>
		<cfset variables.graph_height=(operations_blurb.recordcount*13.1)+50>
	</cfdefaultcase>
</cfswitch>
</cfsilent>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="800000" section_title="Account Mgmt Dashboard" title_class="HeadText#session.workstream_text_size#White">
	<tr>
		<td colspan="2">
			<cfchart scaleFrom="40000" scaleTo="10" font="Trebuchet MS" fontSize="#small#" gridLines="4" show3D="yes" foregroundcolor="##c0c0c0" databackgroundcolor="##ffffff" chartwidth="450" chartheight="#variables.graph_height#">
				<cfchartseries type="horizontalbar" query="operations_blurb" valueColumn="green" itemColumn="description" seriescolor="##33CC99" paintstyle="shade" />
				<cfchartseries type="horizontalbar" query="operations_blurb" valueColumn="yellow" itemColumn="description" seriescolor="yellow" paintstyle="shade" />
				<cfchartseries type="horizontalbar" query="operations_blurb" valueColumn="red" itemColumn="description" seriescolor="red" paintstyle="shade" />
			</cfchart>
			<div align="center">
				<a href="index.cfm?fuseaction=Reports.engagement_dashboard_staff" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Click here for full engagement details and timelines.</a>
			</div>
		</td>
	</tr>
</table>