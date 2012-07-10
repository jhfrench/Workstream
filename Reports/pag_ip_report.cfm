
<!--Reports/pag_ip_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the efficiency report for the engagement that corresponds to what the user requests (as determined by the fuseaction).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/act_update_tasks_pre_defined.cfm">
<cfinclude template="qry_ip_by_week.cfm">
<cfinclude template="qry_ip_by_product.cfm">
<cfoutput>
<form name="drill_down" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<table align="center" border="0" cellpadding="0" cellspacing="1">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="008080" section_title="Implementation Analysis Report" title_class="HeadTextWhite">
	<tr valign="top">
		<td>
			<table border="0" cellpadding="2" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="5" gutter="0" section_color="5F5F5F" section_title="Implementations by Week" title_class="SubHeadTextWhite">
	<cfinclude template="dsp_ip_by_week_header.cfm">
	<cfinclude template="dsp_ip_by_week.cfm">
			</table>
		</td>
		<td>
			<table border="0" cellpadding="2" cellspacing="0">
				<cfmodule template="../common_files/dsp_section_title.cfm" align="center" colspan="3" gutter="0" section_color="5F5F5F" section_title="Implementation Charts" title_class="SubHeadTextWhite">
	<cfinclude template="dsp_ip_by_week_graph.cfm"><!--- 
				<cfinclude template="dsp_ip_by_project.cfm"> --->
			</table>
		</td>
	</tr>
</cfoutput>
</table>
</form>

