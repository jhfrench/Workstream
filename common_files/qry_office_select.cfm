
<!--common_files/qry_office_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select all the cities in the database that are listed as office locations.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfquery name="office_loc" datasource="#application.datasources.main#">
SELECT city AS office_location
FROM location 
WHERE location_type_id = 1
GROUP BY city
</cfquery>