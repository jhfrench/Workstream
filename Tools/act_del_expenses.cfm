
<!--Tools/act_del_expenses.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I delete the values in the expense report so that new values can be inserted, in effect updating the record.

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
	<cfquery name="get_notes_id" datasource="#application.datasources.main#">
	SELECT notes_id
	FROM Expense
	WHERE expense_id=#attributes.expense_id#
	</cfquery>

	<cfquery name="delete_notes" datasource="#application.datasources.main#">
	UPDATE Notes
	SET active_ind=1
	WHERE notes_id=#get_notes_id.notes_id#
	</cfquery>

	<cfquery name="delete_expense" datasource="#application.datasources.main#">
	UPDATE Expense
	SET active_ind=1
	WHERE expense_id=#attributes.expense_id#
	</cfquery>

	<cfquery name="delete_expense_amount" datasource="#application.datasources.main#">
	UPDATE Expense_Amount
	SET active_ind=1
	WHERE expense_id=#attributes.expense_id#
	</cfquery>
</cfsilent>
