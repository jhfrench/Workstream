
<!--Customers/qry_get_flat_rate.cfm
	Author: Jeromy F -->
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
SELECT COALESCE(rate_start_date,'') AS rate_start_date, COALESCE(rate_end_date,'') AS rate_end_date
FROM Flat_Rate
WHERE WHERE active_ind=1
	AND project_id=#attributes.project_id#
</cfquery>
</cfsilent>

