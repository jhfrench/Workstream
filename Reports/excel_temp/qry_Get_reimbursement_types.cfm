
<!--Reports/qry_get_reimbursement_types.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->

</cfsilent>
<cfquery name="get_reimbursement_types" datasource="#application.datasources.main#">
SELECT REF_Reimbursement_Type.Reimbursement_Type, 
    expense.reimbursement_type_id
FROM expense
	INNER JOIN REF_Reimbursement_Type ON expense.reimbursement_type_id = REF_Reimbursement_Type.Reimbursement_ID
    
	INNER JOIN expense_amount ON expense.expense_id = expense_amount.expense_id
    WHERE (expense.work_date >='#From_Date#' AND expense.work_date <='#Through_Date#')
     <cfif compare(project_id, 0) or  isdefined("attributes.emp_id")>
	<cfif compare(project_id, 0) >and expense.project_id = #attributes.project_id#</cfif>
    <cfif isdefined("attributes.emp_id")>and expense.emp_id IN(#attributes.emp_id#)</cfif>
    <cfelse>
    and expense.emp_id = #session.user_account_id#
    </cfif>
GROUP BY REF_Reimbursement_Type.Reimbursement_Type, 
    expense.reimbursement_type_id
ORDER BY reimbursement_type
</cfquery>
<!---  <cfif compare(project_id, 0)>and expense.project_id = #attributes.project_id#</cfif>
    <cfif isdefined("attributes.emp_id")>and expense.emp_id IN(#attributes.emp_id#)</cfif> --->
