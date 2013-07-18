
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
<cfquery name="get_last_weekday" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.main#">
SELECT MAX(odbc_date) AS last_weekday
FROM REF_Date
WHERE date_year=<cfqueryparam value="#attributes.force_year#" cfsqltype="cf_sql_integer" />
	AND date_month=<cfqueryparam value="#attributes.force_month#" cfsqltype="cf_sql_integer" />
	AND holiday_ind=0
	AND weekend_ind=0
</cfquery>
</cfsilent>