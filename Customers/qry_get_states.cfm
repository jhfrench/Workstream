
<!--Customers/qry_get_states.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:13  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:17-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="get_states" datasource="#application.datasources.main#">
    select *
    From REF_states
</cfquery>
