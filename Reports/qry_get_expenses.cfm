
<!--Reports/qry_get_expenses.cfm
	Author: Jeromy F  -->
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
FROM NOTES
	inner join (
	SELECT Reimbursement_Type, work_date,  expense_id,
	     Description, project_code,
	[Name], LName,
	<cfloop query="Get_Expense_Type">
		SUM([#Get_Expense_Type.Expense_Type#]) as '#Get_Expense_Type.Expense_Type#',
	</cfloop>NOTES_ID
	FROM (
	select REF_Reimbursement_Type.Reimbursement_Type, expense.work_date, 
	    Notes.Note, Project.Description, Project.project_code,NOTES.NOTES_ID,

		<cfloop query="Get_Expense_Type">
			(case when #Get_Expense_Type.Expense_Type_ID# = expense_amount.expense_type_id then expense_amount else 0.00 end) as '#Get_Expense_Type.Expense_Type#',
		</cfloop>

		Emp_Contact.Name, Emp_Contact.LName, expense.expense_id
		FROM expense_amount INNER JOIN
		    REF_Expense_Type ON 
		    expense_amount.Expense_type_id = REF_Expense_Type.Expense_type_ID
		     INNER JOIN
		    expense INNER JOIN
		    REF_Reimbursement_Type ON 
		    expense.reimbursement_type_id = REF_Reimbursement_Type.Reimbursement_ID
		     INNER JOIN
		    Emp_Contact ON 
		    expense.emp_id = Emp_Contact.emp_id INNER JOIN
		    Project ON expense.project_id = Project.project_id ON 
		    expense_amount.expense_id = expense.expense_id INNER JOIN
		    Notes ON expense.notes_id = Notes.Notes_ID
		WHERE (expense.work_date >='#From_Date#' AND expense.work_date <='#Through_Date#')
     <cfif compare(project_id, 0) or  isdefined("attributes.emp_id")>
	<cfif compare(project_id, 0) >and expense.project_id = #attributes.project_id#</cfif>
    <cfif isdefined("attributes.emp_id")>and expense.emp_id IN(#attributes.emp_id#)</cfif>
    <cfelse>
    and expense.emp_id = #session.user_account_id#
    </cfif>
    
	) AS JUNK
	GROUP BY Reimbursement_Type, work_date, 
	   Description, project_code, expense_id,
	[Name], LName   ,NOTES_ID 
	) as junk2 on junk2.notes_id = notes.notes_id
ORDER BY  Reimbursement_Type,work_date
</cfquery>
	
</cfsilent>
