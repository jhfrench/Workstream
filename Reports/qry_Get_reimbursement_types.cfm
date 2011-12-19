
<!--Customers/qry_Get_reimbursement_types.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:13:31  stetzer
<>

Revision 1.1  2001-10-11 11:03:58-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfquery name="get_reimbursement_types" datasource="#application.datasources.main#">
SELECT REF_Reimbursement_Type.Reimbursement_Type, 
    expense.reimbursement_type_id
FROM expense INNER JOIN
    REF_Reimbursement_Type ON 
    expense.reimbursement_type_id = REF_Reimbursement_Type.Reimbursement_ID
     INNER JOIN
    expense_amount ON 
    expense.expense_id = expense_amount.expense_id
    WHERE (expense.Work_date >='#From_Date#' AND expense.Work_date <='#Through_Date#')
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
