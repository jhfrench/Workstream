
<!--common_files/qry_office_select.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select all the cities that are in that are in the Database that are listed as office locations.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:42:10  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:37-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<cfquery name="office_loc" datasource="#application.datasources.main#">
SELECT city AS office_location
FROM Location 
WHERE location_type_id = 1
GROUP BY city
</cfquery>