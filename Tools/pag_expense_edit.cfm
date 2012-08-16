
<!--reports/pag_expense_edit.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code for the edit expense form.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_expense_values.cfm">
<!--- <cfinclude template="../tools/pag_expense_entry.cfm"> --->
<cfinclude template="../common_files/qry_expense_types.cfm">
<cfinclude template="qry_expense_crosstab.cfm">
	<cfset num_expense=round(Get_Expense_Type.recordcount/2)>
	<cfset End_Row=Get_Expense_Type.recordcount>
	<cfset start=1>
<cfinclude template="../common_files/qry_project_code.cfm">

<table border="0" cellpadding="4" cellspacing="0" align="center">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText" section_color="ffffff" section_title="Expense Edit Form" colspan="3" gutter="false" align="center">
</table>
<cfform action="index.cfm?fuseaction=Tools.expense_update" method="post" name="f"> 
	<table cellspacing="2" cellpadding="0" border="0" width="95%" >
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadText" section_color="ffffff" section_title="Name: #session.first_name# #session.last_name#" colspan="1" gutter="True">
	</table>
	<table cellspacing="0" cellpadding="4" border="0" align="center">
		<cfinclude template="dsp_expense_type.cfm">
		<cfinclude template="dsp_expense_form_rows.cfm">
	</table>
	</cfform>
	