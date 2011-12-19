

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
Revision 1.1  2005/03/09 18:12:30  stetzer
<>

Revision 1.1  2001-10-11 11:04:04-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 (KL |7/25/01) Added logic to soft error on a company that has no turnover data entered.
	||
	END FUSEDOC --->
<cfset maximum_records="40">
</cfsilent>
<cfinclude template="qry_Get_Reasons.cfm">
<cfinclude template="qry_get_numbers.cfm">
<cfinclude template="act_turnover_report.cfm">
	<table align="center" cellspacing="0">
		<cfif get_numbers.recordcount>
			<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008080" section_title="Turnover Report" gutter="1" align="left" colspan="#colspan#">
			<cfinclude template="dsp_turnover_graph.cfm">
			<cfinclude template="dsp_turnover_row_header.cfm">
			<cfinclude template="dsp_turnover_rows.cfm">
		<cfelse>
			<tr>
				<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">You have no turnover data entered.</td>
			</tr>
</cfif>
		</table>
