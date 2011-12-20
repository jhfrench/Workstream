
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
	||
	Variables:
	END FUSEDOC --->
<cfset attributes.emp_id=ListFirst(attributes.emp_id_project,"|")>
<cfset attributes.project_id=listlast(attributes.emp_id_project,"|")>
<cfset attributes.month=ListFirst(attributes.date,"|")>
<cfset attributes.year=listlast(attributes.date,"|")>
</cfsilent>
<cfinclude template="qry_get_emp_name.cfm">
<cfinclude template="qry_invoice_notes_drill_down.cfm">
<table align="center" cellpadding="2" cellspacing="0" border="0" width="90%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadTextWhite" section_color="772862" section_title="&nbsp;Work Notes for #get_emp_name.name#" colspan="8" gutter=0>
	<cfinclude template="dsp_invoice_notes_drill_down_header.cfm">
	<cfinclude template="dsp_invoice_notes_drill_down.cfm">
</table>

