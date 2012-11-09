
<!--Reports/pag_individual_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain teh output for the individual hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset user_account_id=variables.user_identification>
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfinclude template="qry_individual_hours.cfm">
<table border="0" cellpadding="4" cellspacing="0" align="center" width="95%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="008080" section_title="Individual Hours Report (from #attributes.from_date# to #attributes.through_date#)" gutter="false" align="center" colspan="5">
	<cfinclude template="dsp_indiv_row_header.cfm">
	<cfinclude template="dsp_indiv_rows_output.cfm">
</table>

