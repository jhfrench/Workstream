
<!--Reports/pag_expense_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the expense form.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="../common_files/qry_expense_types.cfm">
	<cfset num_expense=Round(Get_Expense_Type.recordcount/2)>
	<cfset End_Row=(Get_Expense_Type.recordcount)>
	<cfset start=1>
<cfinclude template="../common_files/qry_project_code.cfm">

<h1>Expense Entry Form</h1>
<cfform action="index.cfm?fuseaction=Reports.expense_insert" method="post" name="f"> 
<table cellspacing="0" cellpadding="4" border="0" align="center">
	<caption><h2>Name:  #session.first_name# #session.last_name#</h2></caption>
	<cfinclude template="dsp_expense_type.cfm">
	<cfinclude template="dsp_expense_form_rows.cfm">
</table>
</cfform>
