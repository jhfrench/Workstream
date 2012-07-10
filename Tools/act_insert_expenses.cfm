
<!--Tools/act_insert_expenses.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I insert the expenses.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->


<cfquery name="insert_notes" datasource="#application.datasources.main#">
INSERT INTO Notes (note, emp_id, notes_type_id)
VALUES ('#attributes.note#',#attributes.emp_id#, 6) 
</cfquery>
<cfquery name="get_notes_id" datasource="#application.datasources.main#">
select max(notes_id) as notes_id
from notes
</cfquery>

<cfquery name="insert_expense" datasource="#application.datasources.main#">
INSERT INTO Expense (work_date, emp_id, project_id,
	reimbursement_type_id, notes_id)
VALUES ('#attributes.datefield1#', #attributes.emp_id#, #attributes.project_id#,
	#attributes.reimbursement_type_id#, #get_notes_id.notes_id#)
</cfquery>
<cfquery name="get_expense_id" datasource="#application.datasources.main#">
select max(expense_id) as expense_id
from expense
</cfquery>
<cfloop from="1" to="#Get_Expense_Type.recordcount#" index="ii">
<cfif Compare(evaluate("et_#ii#"), "") and Compare(evaluate("et_#ii#"), ".00")>
<cfquery name="insert_expense_amount" datasource="#application.datasources.main#">
INSERT INTO Expense_Amount (expense_type_id, expense_amount, expense_id) 
VALUES (#ii#, #evaluate("et_#ii#")#, #get_expense_id.expense_id#)
</cfquery>
</cfif>
</cfloop>
</cfsilent>
