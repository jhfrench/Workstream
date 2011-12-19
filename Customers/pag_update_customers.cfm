
<!--Customers/pag_update_customers.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the customer update action pages.

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:46:03  daugherty
	Initial revision

	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_update_customer.cfm">
<cflocation url="index.cfm?fuseaction=Customers.customers" addtoken="No"> 
