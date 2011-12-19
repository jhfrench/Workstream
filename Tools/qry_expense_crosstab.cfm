
<!--tools/qry_expense_crosstab.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the cross tab query that sets up the prepopulation of the expense form for the expense edit option.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="attributes.expense_id" default="null">
<cfquery name="expense_cross_tab" datasource="#application.datasources.main#">
    select
    <cf_removetrailingcomma>
    <cfloop query="Get_Expense_Type">
	SUM(et_#get_expense_type.expense_type_id#) as et_#get_expense_type.expense_type_id#,
	</cfloop>
  </cf_removetrailingcomma>
  From(select expense_amount.expense_type_id,
  <cf_removetrailingcomma>
     <cfloop query="Get_Expense_Type">
	(case when #get_expense_type.expense_type_id# = expense_amount.expense_type_id then expense_amount end) as et_#get_expense_type.expense_type_id#,
	</cfloop>
     </cf_removetrailingcomma>
     from expense, expense_amount, notes
	Where expense.expense_id = expense_amount.expense_id 
    and expense.notes_id = notes.notes_id 
    and expense.expense_id = #attributes.expense_id# ) as GDQUERY
</cfquery>
</cfsilent>

