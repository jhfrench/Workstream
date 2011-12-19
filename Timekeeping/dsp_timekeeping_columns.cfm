
<!--Timekeeping/dsp_timekeeping_columns.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main timekeeping page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_operations_blurb.cfm">
<tr valign="top">
	<td width="10%" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"></td>
	<cfif isdefined("session.workstream_workstream_user")>
	<td width="30%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008080" section_title="PTO" title_class="HeadText#session.workstream_text_size#White">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#pto_blurb#" title_class="RegText#session.workstream_text_size#">
			<!--- <cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008080" section_title="Efficiency" title_class="HeadText#session.workstream_text_size#White">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="Your efficiency decreased from the past month. Your least efficient task (Resolve SBC Error) earned you a score of 45.62. You earned a score of 1223.1 on your most efficient task (Adam's Laptop)" title_class="RegText#session.workstream_text_size#"> --->
		</table>
	</td>
	</cfif>
	<td width="30%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<cfif NOT comparenocase(listlast(session.workstream_company_name),"Nucleus")>
			<cfinclude template="qry_revenue_goal.cfm">
			<cfinclude template="qry_revenue_goal_dept.cfm">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="4" section_color="78A0EB" section_title="Operations Metrics" title_class="HeadText#session.workstream_text_size#White">
			<cfinclude template="dsp_thermo.cfm">
		<cfelse>
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="78A0EB" section_title="Hours Worked" title_class="HeadText#session.workstream_text_size#White">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#hours_blurb#" title_class="RegText#session.workstream_text_size#">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="&nbsp;">
		</cfif>
		</table>
	</td>
	<cfif isdefined("session.workstream_workstream_user")>
	<td width="30%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="800000" section_title="#listlast(session.workstream_company_name)# Life" title_class="HeadText#session.workstream_text_size#White">
<cfif NOT comparenocase(listlast(session.workstream_company_name),"Nucleus")>
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#cc_blurb# #life_blurb#">
<cfelse>
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#life_blurb#">
</cfif>
		</table>
	</td>
	</cfif>
</tr>
<tr>
	<td></td>
	<cfif isdefined("session.workstream_workstream_user") AND operations_blurb.recordcount>
	<td valign="top">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="800000" section_title="Account Mgmt Dashboard" title_class="HeadText#session.workstream_text_size#White">
			<tr>
				<td colspan="2">
					<cfinclude template="dsp_operations_blurb.cfm">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>" align="center">
					<a href="../index.cfm?fuseaction=Reports.engagement_dashboard_staff" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Click here for full engagement details and timelines.</a>
				</td>
			</tr>
		</table>
	</td>
	</cfif>
	<td valign="top" colspan="2">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="3" section_color="78A0EB" section_title="Work Allocation" title_class="HeadText#session.workstream_text_size#White">
			<cfinclude template="dsp_time_allocation_chart.cfm">
		</table>
	</td>
</tr>

