
<!--Customers/qry_get_flat_rate.cfm
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
<cfquery name="get_flat_rate" datasource="#application.datasources.main#">
SELECT COALESCE(rate_start_date,'') AS rate_start_date, COALESCE(rate_end_date,'') AS rate_end_date, COALESCE(months,0) AS months
FROM Flat_Rate
WHERE Flat_Rate.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

