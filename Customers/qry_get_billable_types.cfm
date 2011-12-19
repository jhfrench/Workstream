
<!--Customers/qry_get_billable_types.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all of the information from the REF_Billable table.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:21-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_billable_types" datasource="#application.datasources.main#">
SELECT *
FROM REF_Billable
ORDER BY billable_type
</cfquery>
</cfsilent>

