
<!--Tools/pag_invoice_notes_drill_down.cfm
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
	Revision 1.0  2005/02/15 21:01:46  daugherty
	Initial revision

	Revision 1.0  2002-02-19 14:54:25-05  french
	Creating drill-down to the notes level from the invoice tool.

	||
	Variables:
	END FUSEDOC --->
<cfset attributes.emp_id=ListFirst(attributes.emp_id_project,"|")>
<cfset attributes.project_id=ListLast(attributes.emp_id_project,"|")>
<cfset attributes.month=ListFirst(attributes.date,"|")>
<cfset attributes.year=ListLast(attributes.date,"|")>
</cfsilent>
<cfinclude template="qry_get_emp_name.cfm">
<cfinclude template="qry_invoice_notes_drill_down.cfm">
<table align="center" cellpadding="2" cellspacing="0" border="0" width="90%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="772862" section_title="&nbsp;Work Notes for #get_emp_name.name#" colspan="8" gutter=0>
	<cfinclude template="dsp_invoice_notes_drill_down_header.cfm">
	<cfinclude template="dsp_invoice_notes_drill_down.cfm">
</table>

