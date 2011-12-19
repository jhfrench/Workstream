
<!--Marketing/qry_get_marketing_home_drill.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query to get all the marketing information for the marketing module home page

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:51:17  daugherty
	Initial revision

	Revision 1.2  2001-11-30 11:59:09-05  french
	Fixing report access error and de-stetzering..

	Revision 1.1  2001-10-11 10:55:43-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<!---THIS IS THE MORE STRICT VERSION OF THE QUERY. HOLD ONTO THIS PENDING WHAT SCOFIELD WANST TO DO WITH THIS.
 CASE  When(Prospecting_Begin IS NOT NULL AND 
    Prospecting_End IS NULL and Qualifying_Begin IS NULL and Proposing_Begin IS NULL and Closing_Begin IS NULL) THEN 'Prospecting' 
    WHEN (Prospecting_End IS NOT NULL and Qualifying_Begin IS NOT NULL and Proposing_Begin IS NULL and Closing_Begin IS NULL)
THEN 'Qualifying' 
WHEN (Prospecting_End IS NOT NULL AND 
    Qualifying_End IS NOT NULL and Proposing_Begin IS NOT NULL and Closing_Begin IS NULL)
THEN 'Proposing' 
WHEN (Prospecting_End IS NOT NULL AND 
    Qualifying_End IS NOT NULL and Proposing_End IS NOT NULL and Closing_Begin IS NOT NULL and Closing_End IS NULL) 
THEN 'Closing' ELSE Null --->
<cfquery name="get_marketing_home_drill" datasource="#application.datasources.main#">
SELECT * 
FROM 
	(SELECT Description,
		CASE 
			WHEN (prospecting_begin IS NOT NULL AND prospecting_end IS NULL) THEN 'Prospecting' 
			WHEN (qualifying_begin IS NOT NULL AND qualifying_end IS NULL) THEN 'Qualifying' 
			WHEN (proposing_begin IS NOT NULL and proposing_end IS NULL) THEN 'Proposing' 
			WHEN (closing_begin IS NOT NULL and closing_end IS NULL) THEN 'Closing' 
			ELSE NULL END
		AS status
	FROM Marketing_For_Web_Query)
AS Marketing_Data
WHERE Marketing_Data.status <cfif comparenocase(variable,"All")>='#Variable#'<cfelse>IS NOT NULL</cfif>
ORDER BY description
</cfquery>
</cfsilent>

