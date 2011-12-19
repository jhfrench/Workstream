
<!--Reports/pag_revenue_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:23  stetzer
	<>

	Revision 1.3  2001-11-05 14:33:11-05  french
	Changed header color to match reports module standard.

	Revision 1.2  2001-10-30 11:39:13-05  french
	Made changes to accomodate new billing type (

	Revision 1.1  2001-10-11 11:04:05-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_revenue_report.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="98%">
<cfoutput>
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="008080" section_title="Monthly Sales" title_class="HeadText#session.workstream_text_size#White">
	<tr>
		<td valign="top">
			<cfinclude template="dsp_revenue_report_chart.cfm">
		</td>
		<td align="center" valign="top" class="SubHeadText#session.workstream_text_size#">
		<cfif revisedrecordcount>
			<cfinclude template="dsp_revenue_report_graph.cfm">
		</cfif>
		</td>
	</tr>
</cfoutput>
</table>


