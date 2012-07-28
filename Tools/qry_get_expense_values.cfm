
<!--tools/qry_get_expense_values.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the values for the edit expense report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->

<cfquery name="get_expense_values" datasource="#application.datasources.main#">
SELECT Notes.note, Expense.reimbursement_type_id, Expense.work_date,
	Expense.project_id 
FROM Expense
	INNER JOIN Notes ON Expense.notes_id=Notes.notes_id 
WHERE Notes.active_ind=1
	AND Expense.expense_id = #attributes.expense_id# 
</cfquery>
</cfsilent>
