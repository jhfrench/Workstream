
<!--Reports/qry_expense_types.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the reimbursement types and the different expense types for the expense form and the expense report.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:54  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:42-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->


<cfquery name="get_Expense_Category" datasource="#application.datasources.main#" >
SELECT  *
FROM REF_Expense_Category
ORDER BY order_by, expense_category_id
</cfquery>
