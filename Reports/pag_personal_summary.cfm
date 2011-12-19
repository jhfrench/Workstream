
<!--Reports/pag_personal_summary.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project and week.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:10  stetzer
	<>

	Revision 1.2  2001-12-02 17:58:15-05  french
	Formatting changes.

	Revision 1.1  2001-10-11 11:04:08-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfparam name="attributes.month" default="#month(now())#">
<cfparam name="attributes.year" default="#year(now())#">
<cfparam name="attributes.emp_id" default="#session.user_account_id#">
</cfsilent>
<cfset blah=0>
<cfinclude template="qry_leader_hours_by_month.cfm">
<table border="0" cellpadding="0" cellspacing="2" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008080" section_title="Personal Hours Report for #monthasstring(attributes.month)# #attributes.year#" gutter="false" align="center">
	<tr>
		<td valign="top">
			<cfinclude template="dsp_personal_summary_by_code.cfm">
		</td>
		<td valign="top">
			<cfinclude template="dsp_personal_summary_by_week.cfm">
		</td>
	</tr>
</table>

