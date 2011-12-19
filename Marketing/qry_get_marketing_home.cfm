
<!--Marketing/qry_get_marketing_data.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query to get all the marketing information for the marketing module home page
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:51:16  daugherty
	Initial revision

	Revision 1.2  2001-11-30 11:59:08-05  french
	Fixing report access error and de-stetzering..

	Revision 1.1  2001-10-11 10:55:43-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	END FUSEDOC --->
<cfquery name="marketing_home" datasource="#application.datasources.main#">
<!---Adam - 082901 - THERE ARE TWO WAYS TO DO THIS QUERY - IT DEPENDS ON HOW STRICTLY YOU WANT TO FOLLOW THE FUNNEL STEPS. THIS QUERY IS MUCH MORE RIGID THAN THE ONE CURRENTLY ACTIVE. DOUBLE COUNTING IS POSSIBLE WITH THE ACTIVE QUERY - BUT NOT THIS ONE.

SELECT 
SUM(CASE WHEN (Prospecting_Begin IS NOT NULL AND 
    Prospecting_End IS NULL AND Qualifying_Begin IS NULL AND Proposing_Begin IS NULL AND Closing_Begin IS NULL) THEN 1 ELSE 0
    END) AS Prospecting,
SUM(CASE WHEN (Prospecting_End IS NOT NULL AND Qualifying_Begin IS NOT NULL AND Proposing_Begin IS NULL AND Closing_Begin IS NULL) THEN 1 ELSE 0
    END) AS Qualifying,
SUM(CASE WHEN (Prospecting_End IS NOT NULL AND 
    Qualifying_End IS NOT NULL AND Proposing_Begin IS NOT NULL AND Closing_Begin IS NULL) THEN 1 ELSE 0
    END) AS Proposing,
SUM(CASE WHEN (Prospecting_End IS NOT NULL AND 
    Qualifying_End IS NOT NULL AND Proposing_End IS NOT NULL AND Closing_Begin IS NOT NULL AND Closing_End IS NULL) THEN 1 ELSE 0
    END) AS Closing
FROM Marketing_For_Web_Query --->
SELECT SUM(CASE WHEN (prospecting_begin IS NOT NULL AND prospecting_end IS NULL) THEN 1 ELSE 0 END) AS prospecting,
	SUM(CASE WHEN (qualifying_begin IS NOT NULL AND qualifying_end IS NULL) THEN 1 ELSE 0 END) AS qualifying,
	SUM(CASE WHEN (proposing_begin IS NOT NULL AND proposing_end IS NULL) THEN 1 ELSE 0 END) AS proposing,
	SUM(CASE WHEN (closing_begin IS NOT NULL AND closing_end IS NULL) THEN 1 ELSE 0 END) AS closing,
	SUM(CASE WHEN (
		(prospecting_begin IS NOT NULL AND prospecting_end IS NULL)
	OR
		(qualifying_begin IS NOT NULL AND qualifying_end IS NULL)
	OR
		(proposing_begin IS NOT NULL AND proposing_end IS NULL)
	OR
		(closing_begin IS NOT NULL AND closing_end IS NULL)
	) THEN 0 ELSE 1 END) AS not_active
FROM Marketing_For_Web_Query
</cfquery>
</cfsilent>

