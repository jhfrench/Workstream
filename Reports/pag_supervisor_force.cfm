
<!--Reports/pag_supervisor_force.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the supervisor's ForcePlanner report. This report shows direct report's tasks and hours for complete and incomplete, budgeted and un-budgeted tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfparam name="attributes.from_date" default="#month(now())#/1/#year(now())#">
<cfparam name="attributes.to_date" default="#month(now())#/#DaysInMonth(now())#/#year(now())#">
</cfsilent>
<cfinclude template="qry_supervisor_force.cfm">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="10" gutter="0" section_color="008080" section_title="&nbsp;ForcePlanner Report" title_class="HeadTextWhite">
	<cfinclude template="dsp_supervisor_force_header.cfm">
	<cfinclude template="dsp_supervisor_force_row.cfm">
</table>
<cfinclude template="act_force_hidden_links.cfm">

