
<!--Reports/qry_get_expenses.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that is used for the expense report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_expenses" datasource="#application.datasources.main#">
SELECT junk2.*, note, expense_id
FROM Notes
	INNER JOIN (
		SELECT Reimbursement_Type, work_date, expense_id,
			Description, project_code, [Name], LName,
			<cfloop query="Get_Expense_Type">
			SUM([#Get_Expense_Type.Expense_Type#]) as '#Get_Expense_Type.Expense_Type#',
			</cfloop>notes_id
	FROM (
		select REF_Reimbursement_Type.Reimbursement_Type, expense.work_date, 
			Notes.Note, Project.description, Project.project_code,NOTES.notes_id,
			<cfloop query="Get_Expense_Type">
			(CASE WHEN #Get_Expense_Type.Expense_Type_ID# = expense_amount.expense_type_id then expense_amount else 0.00 end) AS '#Get_Expense_Type.Expense_Type#',
			</cfloop>
			Emp_Contact.Name, Emp_Contact.LName, expense.expense_id
		FROM expense_amount
			INNER JOIN REF_Expense_Type ON expense_amount.Expense_type_id = REF_Expense_Type.Expense_type_ID
			INNER JOIN expense
			INNER JOIN REF_Reimbursement_Type ON expense.reimbursement_type_id = REF_Reimbursement_Type.Reimbursement_ID
			INNER JOIN Emp_Contact ON expense.emp_id = Emp_Contact.emp_id
			INNER JOIN Project ON expense.project_id = Project.project_id ON expense_amount.expense_id = expense.expense_id
			INNER JOIN Notes ON expense.notes_id = Notes.notes_id
		WHERE (expense.work_date >='#From_Date#'
			AND expense.work_date <='#Through_Date#')<cfif compare(project_id, 0) or isdefined("attributes.emp_id")>
	<cfif compare(project_id, 0) >AND expense.project_id = #attributes.project_id#</cfif>
	<cfif isdefined("attributes.emp_id")>AND expense.emp_id IN (#attributes.emp_id#)</cfif>
	<cfelse>
			AND expense.emp_id = #session.user_account_id#
	</cfif>
	) AS JUNK
	GROUP BY Reimbursement_Type, work_date, Description,
		project_code, expense_id, [Name],
		LName, notes_id 
	) AS junk2 ON junk2.notes_id = notes.notes_id
WHERE Notes.active_ind=1
ORDER BY  Reimbursement_Type,work_date
</cfquery>

</cfsilent>
