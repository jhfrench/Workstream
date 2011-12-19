
<!--Tools/pag_invoice_details.cfm
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
	Revision 1.0  2005/02/15 21:01:44  daugherty
	Initial revision

	Revision 1.3  2002-02-26 12:31:37-05  french
	Changed page header to make it easier to read for Adam.

	Revision 1.2  2002-02-19 14:54:55-05  french
	Creating drill-down to the notes level from the invoice tool.

	Revision 1.1  2001-10-11 13:15:25-04  long
	Added FuseDoc

	||
	Variables:
	END FUSEDOC --->
<cfset attributes.billable_id=ListLast(attributes.project_id,"|")>
<cfset attributes.project_id=ListFirst(attributes.project_id,"|")>
<cfset attributes.month=ListFirst(attributes.drill_through,"|")>
<cfset attributes.year=ListLast(attributes.drill_through,"|")>
</cfsilent>
<cfinclude template="qry_invoice_details.cfm">
<table align="center" cellpadding="1" cellspacing="0" border="1" bordercolor="#772862" width="70%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="772862" section_title="&nbsp;Invoice Details for Work Completed in #MonthAsString(attributes.month)#" colspan="8" gutter=0>
	<cfinclude template="dsp_invoice_details_header.cfm">
	<cfinclude template="dsp_invoice_details.cfm">
</table>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="list_to_emp" field_name="emp_id" field2_name="ignore_owner" field2_value="#attributes.month#|#attributes.year#" directory_action="../Directory/" fuseaction="employee_details">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="emp_to_notes" field_name="emp_id_project" field2_name="date" field2_value="#attributes.month#|#attributes.year#" fuseaction="invoice_notes_drill_down">

