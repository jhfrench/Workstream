
<!--Reports/pag_manager_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the manager hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfif attributes.from_date LTE now() AND attributes.from_date LTE attributes.through_date>
	<cfset variables.object_id=4>
	<cfset variables.user_account_id=0>
	<cfset variables.compare_date="">
	<cfinclude template="qry_manager_hours_report_output.cfm">
	<table border="0" cellpadding="2" cellspacing="0" align="center" width="95%">
		<cfmodule template="../common_files/dsp_section_title.cfm" section_color="008080" section_title="Manager's Hours Report (from #attributes.from_date# to #attributes.through_date#)" gutter="false" align="center" colspan="6" title_class="HeadTextWhite">
	<cfif manager_hours_report_output.recordcount>
	<cfoutput query="manager_hours_report_output">
		<cfinclude template="dsp_manager_hours_row_header.cfm">
		<cfinclude template="dsp_manager_hours_rows.cfm">
	</cfoutput>
		<cfif manager_hours_report_output.hours>
			<cfinclude template="dsp_manager_hours_total_hours.cfm">
		</cfif>
	<cfelse>
		<tr>
			<td colspan="6">You have no subordinates listed in the database.</td>
		</tr>
	</cfif>
	</table>
</cfif>

