
<!--Reports/pag_Mgr_Indiv_Hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the manager individual hours report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:11:58  stetzer
<>

Revision 1.1  2001-10-11 11:04:11-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="95%">
	<cfinclude template="Act_verify_dates.cfm">
	<cfinclude template="qry_manager_individual_Hours.cfm">
	<cfinclude template="qry_individual_hours.cfm">
	<a href="index.cfm?fuseaction=Manager_individual_hours_input" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">Choose another employee to view.</a>
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#" section_color="ffffff" section_title="Individual Hours Report"  gutter="false" align="center" colspan="5">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText#session.workstream_text_size#" section_color="ffffff" section_title="From: #attributes.from_date# &nbsp;To: #attributes.through_date#" gutter="false" align="center" colspan="5">
	<cfinclude template="dsp_Indiv_Row_Header.cfm">
	<cfinclude template="dsp_indiv_rows_output.cfm">
</table>
