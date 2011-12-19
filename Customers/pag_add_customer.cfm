
<!--Customers/pag_add_customer.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:45:58  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:25-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfinclude template="act_set_root_code.cfm">
<cfinclude template="act_add_customer.cfm">
<cflocation addtoken="No" url="index.cfm?fuseaction=customers">
