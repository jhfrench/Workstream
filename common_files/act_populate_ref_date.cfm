<!-- common_files/act_populate_ref_date.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_populate_ref_date.cfm">
	<responsibilities>
		I am used by most of the reports to allow the user to specify criteria for that report.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->

<cfquery name="get_last_date" datasource="#application.datasources.main#">
SELECT MAX(odbc_date) AS last_date
FROM REF_Date
</cfquery>
<cfset variables.from_date=dateadd("d", 1, get_last_date.last_date)>
<cfset variables.through_date=dateadd("d", 1200, variables.from_date)>
<cftransaction>
<cfloop from="#variables.from_date#" to="#variables.through_date#" index="date_ii">
	<cfset variables.date_to_insert=createodbcdate(date_ii)>
	<cfset variables.day_of_week_number=dayofweek(variables.date_to_insert)>
	<cfif month(variables.date_to_insert) GT 9>
		<cfset variables.fiscal_year=year(variables.date_to_insert)+1>
	<cfelse>
		<cfset variables.fiscal_year=year(variables.date_to_insert)>
	</cfif>
	<cfquery name="insert_date" datasource="#application.datasources.main#">
	INSERT INTO REF_Date (odbc_date, day_of_week_number,
		holiday_ind, weekend_ind, date_year,
		date_month, date_day, fiscal_year, program_year_id)
	VALUES (#variables.date_to_insert#, #variables.day_of_week_number#,
		0, <cfif listfind("1,7", variables.day_of_week_number)>1<cfelse>0</cfif>, #year(variables.date_to_insert)#,
		#month(variables.date_to_insert)#, #day(variables.date_to_insert)#, #variables.fiscal_year#, <cfif variables.fiscal_year GT 2006>#variables.fiscal_year-2006#<cfelse>NULL</cfif>)
	</cfquery>
</cfloop>
</cftransaction>