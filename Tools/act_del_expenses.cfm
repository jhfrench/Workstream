
<!--Tools/Act_del_expenses.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I delete the values in the expense report so that new values can be inserted, in effect updating the record.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 21:00:48  daugherty
Initial revision

Revision 1.1  2001-10-11 10:54:30-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
	<cfquery name="get_notes_id" datasource="#application.datasources.main#">
	    select notes_id 
	    from expense
	    where #attributes.expense_id#  = expense_id
	</cfquery>
	
	<cfquery name="delete_notes" datasource="#application.datasources.main#">
         delete From notes
	    where #get_notes_id.notes_id# = notes_id    
     </cfquery>
		
	<cfquery name="delete_expense" datasource="#application.datasources.main#">
         delete from expense
	    where #attributes.expense_id#  = expense_id
     </cfquery>
	
	<cfquery name="delete_expense_amount" datasource="#application.datasources.main#">
         delete From expense_amount
	    where #attributes.expense_id#  = expense_id
     </cfquery>
</cfsilent>
