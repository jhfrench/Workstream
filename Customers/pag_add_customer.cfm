
<!--Customers/pag_add_customer.cfm
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
<cfinclude template="act_set_root_code.cfm">
<cfinclude template="act_add_customer.cfm">
<cflocation addtoken="No" url="index.cfm?fuseaction=Customers.customers">
