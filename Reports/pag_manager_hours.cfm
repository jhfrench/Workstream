
<!--Reports/pag_manager_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the manager hours report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:11:52  stetzer
<>

Revision 1.2  2002-03-07 10:21:30-05  long
Changed the file to work with a single query

Revision 1.1  2001-10-11 11:04:12-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfif attributes.from_date LTE now() AND attributes.from_date LTE attributes.through_date>
	<cfset variables.object_id=4><!--- 
	<cfinclude template="qry_get_supervisor_info.cfm">
	<cfset variables.all_option=get_supervisor_info.all_option> --->
	<cfset variables.emp_id=0>
	<cfset variables.compare_date="">
	<cfinclude template="qry_manager_hours_report_output.cfm">
	<table border="0" cellpadding="2" cellspacing="0" align="center" width="95%">
		<cfmodule template="../common_files/dsp_section_title.cfm" section_color="008080" section_title="Manager's Hours Report (from #attributes.from_date# to #attributes.through_date#)" gutter="false" align="center" colspan="6" title_class="HeadText#session.workstream_text_size#White">
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

