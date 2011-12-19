
<!--Customers/qry_get_incident_charge.cfm
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
Revision 1.0  2005/02/15 20:46:10  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:18-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_incident_charge" datasource="#application.datasources.main#">
SELECT charge
FROM Incident_Rate
WHERE Incident_Rate.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

