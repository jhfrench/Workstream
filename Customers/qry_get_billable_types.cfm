
<!--Customers/qry_get_billable_types.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all of the information from the REF_Billable_Type table.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_billable_types" datasource="#application.datasources.main#">
SELECT *
FROM REF_Billable_Type
ORDER BY description
</cfquery>
</cfsilent>

