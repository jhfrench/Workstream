

<!--reports/pag_turnover_report.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display a graph and a table that illustrate the turnover metrics for a given company.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset maximum_records="40">
</cfsilent>
<cfinclude template="qry_Get_Reasons.cfm">
<cfinclude template="qry_get_numbers.cfm">
<cfinclude template="act_turnover_report.cfm">
	<table align="center" cellspacing="0">
		<cfif get_numbers.recordcount>
			<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008080" section_title="Turnover Report" gutter="1" align="left" colspan="#colspan#">
			<cfinclude template="dsp_turnover_graph.cfm">
			<cfinclude template="dsp_turnover_row_header.cfm">
			<cfinclude template="dsp_turnover_rows.cfm">
		<cfelse>
			<tr>
				<td class="SubHeadText">You have no turnover data entered.</td>
			</tr>
</cfif>
		</table>
