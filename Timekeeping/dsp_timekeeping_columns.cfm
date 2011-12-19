
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
	<td width="30%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008080" section_title="PTO" title_class="HeadText#session.workstream_text_size#White">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#pto_blurb#" title_class="RegText#session.workstream_text_size#">
			<!--- <cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008080" section_title="Efficiency" title_class="HeadText#session.workstream_text_size#White">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="Your efficiency decreased from the past month. Your least efficient task (Resolve SBC Error) earned you a score of 45.62. You earned a score of 1223.1 on your most efficient task (Adam's Laptop)" title_class="RegText#session.workstream_text_size#"> --->
		</table>
	</td>
	<td width="30%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
		<!--- $issue$: bring this back into play --->
		<cfif session.workstream_company_id EQ 1>
			<cfinclude template="../common_files/qry_get_revenue_goal.cfm">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="4" section_color="78A0EB" section_title="Operations Metrics" title_class="HeadText#session.workstream_text_size#White">
			<cfinclude template="dsp_thermo.cfm">
		<cfelse>
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="78A0EB" section_title="Hours Worked" title_class="HeadText#session.workstream_text_size#White">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#variables.hours_blurb#" title_class="RegText#session.workstream_text_size#">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="&nbsp;">
		</cfif>
		</table>
	</td>
	<td width="30%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="800000" section_title="#listlast(session.workstream_company_name)# Life" title_class="HeadText#session.workstream_text_size#White">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#life_blurb#">
		</table>
	</td>
</tr>
<tr>
	<td></td>
	<cfif operations_blurb.recordcount>
	<td valign="top">
			<cfinclude template="dsp_operations_blurb.cfm">
	</td>
	</cfif>
	<td valign="top" colspan="2">
			<cfinclude template="dsp_time_allocation_chart.cfm">
	</td>
</tr>

