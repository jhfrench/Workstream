
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
	 || 
 --->
<cfquery name="get_last_weekday" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT MAX(odbc_date) AS last_weekday
FROM REF_Date
WHERE date_month=#attributes.force_month#
	AND date_year=#attributes.force_year#
	AND holiday_ind=0
	AND weekend_ind=0
</cfquery>
</cfsilent>

