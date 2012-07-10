
<!--Customers/qry_get_billable_types.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all of the information from the REF_Billable table.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_billable_types" datasource="#application.datasources.main#">
SELECT *
FROM REF_Billable
ORDER BY billable_type
</cfquery>
</cfsilent>

