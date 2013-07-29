
<!--Tools/act_insert_expenses.cfm
	Author: Jeromy F -->
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
INSERT INTO Notes (note, user_account_id, notes_type_id)
VALUES ('#attributes.note#', #attributes.user_account_id#, 4)
RETURNING notes_id
</cfquery>

<cfquery name="insert_expense" datasource="#application.datasources.main#">
INSERT INTO Expense (work_date, user_account_id, project_id,
	reimbursement_type_id, notes_id)
VALUES ('#attributes.datefield1#', #attributes.user_account_id#, #attributes.project_id#,
	#attributes.reimbursement_type_id#, #insert_notes.notes_id#)
RETURNING expense_id
</cfquery>

<cfloop from="1" to="#get_expense_type.recordcount#" index="ii">
	<cfif len(evaluate("et_#ii#")) and compare(evaluate("et_#ii#"), ".00")>
		<cfquery name="insert_expense_amount" datasource="#application.datasources.main#">
		INSERT INTO Expense_Amount (expense_type_id, expense_amount, expense_id)
		VALUES (#ii#, #evaluate("et_#ii#")#, #insert_expense.expense_id#)
		</cfquery>
	</cfif>
</cfloop>
</cfsilent>
