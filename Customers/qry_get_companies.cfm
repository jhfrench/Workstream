
<!--Customers/qry_get_companies.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve all the information contained in the REF_Company table.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_companies" datasource="#application.datasources.main#">
SELECT * 
FROM REF_Company
ORDER BY description
</cfquery> 
</cfsilent>

