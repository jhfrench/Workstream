
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
	 || 
	END FUSEDOC --->
<cfquery name="get_incident_charge" datasource="#application.datasources.main#">
SELECT charge
FROM Incident_Rate
WHERE Incident_Rate.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

