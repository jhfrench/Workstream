
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
Revision 1.0  2005/02/15 20:46:10  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:19-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfquery name="get_flat_rate" datasource="#application.datasources.main#">
SELECT ISNULL(start_date,'') AS start_date, ISNULL(end_date,'') AS end_date, ISNULL(months,0) AS months
FROM Flat_Rate
WHERE Flat_Rate.project_id=#attributes.project_id#
</cfquery>
</cfsilent>

