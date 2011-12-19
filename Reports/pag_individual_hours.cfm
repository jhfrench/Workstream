
<!--Reports/pag_individual_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain teh output for the individual hours report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:11:21  stetzer
	<>

	Revision 1.2  2001-12-06 14:35:03-05  french
	Applying style sheet correctly to Reports module. Adding Customers.description to output.

	Revision 1.1  2001-10-11 11:04:14-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfset emp_id=session.user_account_id>
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfinclude template="qry_individual_hours.cfm">
<table border="0" cellpadding="4" cellspacing="0" align="center" width="95%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008080" section_title="Individual Hours Report (from #attributes.from_date# to #attributes.through_date#)" gutter="false" align="center" colspan="5">
	<cfinclude template="dsp_indiv_row_header.cfm">
	<cfinclude template="dsp_indiv_rows_output.cfm">
</table>

