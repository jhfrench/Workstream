
<!--Reports/pag_expense_entry.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the expense form.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:10:13  stetzer
<>

Revision 1.1  2001-10-11 11:04:22-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/act_calendar.cfm">
<cfinclude template="../common_files/qry_expense_types.cfm">
	<cfset num_expense=Round(Get_Expense_Type.recordcount/2)>
	<cfset End_Row=(Get_Expense_Type.recordcount)>
	<cfset start=1>
<cfinclude template="../common_files/qry_project_code.cfm">


<table border="0" cellpadding="4" cellspacing="0"  align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#" section_color="ffffff" section_title="Expense Entry Form" colspan="3" gutter="false" align="center">
</table>

<cfform action="index.cfm?fuseaction=expense_insert" method="post"  name="f"> 
	<table  cellspacing="2" cellpadding="0" border="0" width="95%" >
		<div id="FormLayer" style="position:absolute; width:300px; height:245px; z-index:1"> 
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText#session.workstream_text_size#" section_color="ffffff" section_title="Name:  #session.first_name# #session.last_name#" colspan="1" gutter="True">
</div>
	</table>
	<table cellspacing="0" cellpadding="4" border="0" align="center">
		<cfinclude template="dsp_expense_type.cfm">
	
		<cfinclude template="dsp_expense_form_rows.cfm">
		</table>
	</cfform>
	
	


