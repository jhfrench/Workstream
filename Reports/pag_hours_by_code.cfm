
<!--Report/pag_hours_by_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the hours by code report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="Act_verify_dates.cfm">
<cfinclude template="qry_hours_code.cfm">
<table border="0" cellpadding="4" cellspacing="0" align="center" width="95%">

<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#" section_color="ffffff" section_title="Hours By Code Report"  gutter="false" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText#session.workstream_text_size#" section_color="ffffff" section_title="From: #attributes.from_date# &nbsp;To: #attributes.through_date#" gutter="false" align="center">
	<cfoutput query="hours_code">
		<cfif NOT temp_cc IS ClientCode>
		   	<cfset count=0>
		      <cfset temp_cc=ClientCode>
		     	 <cfif hours_code.CurrentRow GT 1>
				 	<cfinclude template="dsp_hours_code_totals.cfm">
				</cfif>
				<cfinclude template="dsp_hours_code_row_header.cfm">
			</cfif>
		<cfinclude template="dsp_hours_code_rows.cfm">
		<cfif hours_code.recordcount EQ hours_code.CurrentRow>
			<cfinclude template="dsp_hours_code_totals.cfm">
		</cfif>
	</cfoutput>
</table>
