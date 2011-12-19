
<!--Customers/qry_get_company_id.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the main project details.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:17  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:13-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_company_id" datasource="#application.datasources.main#">
SELECT company_id
FROM Link_Project_Company
WHERE project_id=#attributes.project_id#
</cfquery>
</cfsilent>

