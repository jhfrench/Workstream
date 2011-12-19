
<!--Tools/qry_get_last_weekday.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 21:02:07  daugherty
	Initial revision

	Revision 1.0  2001-11-28 13:49:12-05  french
	Initial file creation.

	||
 --->
<cfquery name="get_last_weekday" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT MAX(date) AS last_weekday
FROM REF_Days
WHERE themonth=#attributes.force_month#
	AND theyear=#attributes.force_year#
	AND holiday IS NULL 
	AND workday=1
</cfquery>
</cfsilent>

