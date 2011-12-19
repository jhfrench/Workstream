
<!--Reports/pag_pto_report_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the PTO roport input page.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:12:19  stetzer
	<>

	Revision 1.5  2001-11-02 10:32:46-05  long
	Changed the if structure around the varibles.action set so that it sends the proper people to the proper report.

	Revision 1.4  2001-10-31 17:33:27-05  french
	Fixing code that was breaking for LewisCo employees.

	Revision 1.3  2001-10-16 12:14:35-04  french
	Minor formatting changes for display or readability.

	Revision 1.2  2001-10-16 08:47:21-04  long
	Made this input screen send you to the proper type of PTO report, depending upon what type of PTO you receive.
	
	Revision 1.1  2001-10-11 11:04:06-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfparam name="session.workstream_pto_accrual_type_id" default="2">
<cfif session.workstream_pto_accrual_type_id EQ 1>
	<cfset variables.action="pto">
<cfelse>
	<cfset variables.action="pto_accrual_input">
</cfif>
</cfsilent>
<cfinclude template="act_pto_name_select.cfm">
<cfform name="pto_report_input" action="index.cfm?fuseaction=#action#" method="POST">
<table border="0" cellpadding="1" cellspacing="0" align="center" width="30%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" gutter="1" section_color="008080" section_title="&nbsp;Personal Time Off Report" title_class="HeadText#session.workstream_text_size#White">
	<cfinclude template="dsp_pto_report_input.cfm">
</table>
</cfform>

