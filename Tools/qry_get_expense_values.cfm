
<!--tools/qry_get_expense_values.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the values for the edit expense report.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:02:03  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:13-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="get_expense_values" datasource="#application.datasources.main#">
    select  notes.note, expense.reimbursement_type_id, expense.work_date, expense.project_id 
    from expense, notes
    Where expense.notes_id = notes.notes_id 
    and expense.expense_id = #attributes.expense_id# 
</cfquery>
</cfsilent>
