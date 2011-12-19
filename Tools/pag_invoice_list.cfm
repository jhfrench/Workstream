
<!--Tools/pag_invoice_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the invoice tool invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 21:01:45  daugherty
	Initial revision

	Revision 1.2  2002-02-26 12:30:14-05  french
	Changed page header to make it easier to read for Adam.

	Revision 1.1  2001-10-11 13:15:21-04  long
	Added FuseDoc

	||
	Variables:
	END FUSEDOC --->
<cfparam name="attributes.month" default="#DatePart("m",now())#">
<cfparam name="attributes.year" default="#DatePart("yyyy",now())#">
</cfsilent>
<cfinclude template="qry_get_extreme_dates.cfm">
<cfinclude template="qry_invoice_list.cfm">
<table align="center" cellpadding="1" cellspacing="0" border="1" bordercolor="#772862" width="70%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="772862" section_title="&nbsp;Invoice List for Work Completed in #MonthAsString(attributes.month)#, #attributes.year#" colspan="5" gutter=0>
	<cfinclude template="dsp_invoice_list_header.cfm">
	<cfinclude template="dsp_invoice_list.cfm">
	<cfinclude template="dsp_invoice_list_form.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_details" field_name="project_id" field2_name="drill_through" field2_value="#attributes.month#|#attributes.year#" fuseaction="invoice_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_tasks" field_name="project_id" field2_name="ignore_owner" field2_value="#attributes.month#|#attributes.year#" fuseaction="Timekeeping.task_list">

