
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
	END FUSEDOC --->
</cfsilent>
<table cellpadding="0" cellspacing="3" border="0" width="100%">
<tr valign="top">
	<td width="25%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008080" section_title="PTO" title_class="HeadTextWhite">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#pto_blurb#" title_class="RegText">
			<!--- <cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008080" section_title="Efficiency" title_class="HeadTextWhite">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="Your efficiency decreased from the past month. Your least efficient task (Resolve SBC Error) earned you a score of 45.62. You earned a score of 1223.1 on your most efficient task (Adam's Laptop)" title_class="RegText"> --->
		</table>
	</td>
	<td width="25%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="800000" section_title="#listlast(session.workstream_company_name)# Life" title_class="HeadTextWhite">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#life_blurb#">
		</table>
	</td>
	<td width="25%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="78A0EB" section_title="Hours Worked" title_class="HeadTextWhite">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="#variables.hours_blurb#" title_class="RegText">
			<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="&nbsp;">
		</table>
	</td>
	<td width="25%">
		<table cellpadding="0" cellspacing="0" border="0" width="100%">
			<cfinclude template="../common_files/qry_get_revenue_goal.cfm">
			<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008080" section_title="Revenue Goal" title_class="HeadTextWhite">
			<cfinclude template="dsp_revenue_progress.cfm">
		</table>
	</td>
</tr>
</table>

<table cellpadding="0" cellspacing="3" border="0" width="100%">
<tr>
	<cfif operations_blurb.recordcount>
	<td valign="top">
		<cfinclude template="dsp_operations_blurb.cfm">
	</td>
	</cfif>
	<td valign="top" colspan="2">
		<cfinclude template="dsp_time_allocation_chart.cfm">
	</td>
</tr>
</table>

