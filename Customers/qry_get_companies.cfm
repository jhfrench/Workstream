
<!--Customers/qry_get_companies.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the information contained in the REF_Company table.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:21-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_companies" datasource="#application.datasources.main#">
SELECT * 
FROM REF_Company
ORDER BY company
</cfquery> 
</cfsilent>

