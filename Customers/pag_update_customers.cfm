
<!--Customers/pag_update_customers.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the customer update action pages.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfinclude template="act_update_customer.cfm">
<cflocation url="index.cfm?fuseaction=Customers.customers" addtoken="No"> 
