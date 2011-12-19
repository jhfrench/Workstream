
<!--Reports/pag_expense_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the expense report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:11:04  stetzer
<>

Revision 1.1  2001-10-11 11:04:16-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	(KL | 8/30/2001) added DSP_ to the "no_results" include...
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_verify_dates.cfm">
<cfinclude template="qry_get_expense_types.cfm">
<cfinclude template="qry_get_expenses.cfm">
<cfset colspan= get_expense_type.recordcount +5>
<cfset totals = StructNew()>
<table border="0" width="100%" cellpadding="3" cellspacing="0">
	<cfif get_expense_type.recordcount>
	<tr><td  align="right"colspan="<cfoutput>#colspan#</cfoutput>" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
	<cfinclude template="dsp_excel_auto.cfm">
	</td></tr>
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#" section_color="ffffff" section_title="Expense Report"  gutter="false" align="center" colspan="#colspan#">
	
	<cfinclude template="dsp_expense_report_rows.cfm">
	
</table> 
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="expense" directory_action="../tools/" fuseaction="Expense_edit" field_name="expense_id">

<cfelse>
<cfinclude template="dsp_no_results.cfm">
</cfif>

<!--- <td>#arraysum(listtoarray(valuelist(get_expenses[expense_type][currow])))#</td> --->
