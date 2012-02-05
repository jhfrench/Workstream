<!--Administration/qry_insert_ref_date.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_date.cfm">
	<responsibilities>
		I create a new REF_Date record.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="10/4/10" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.date_id" default="0">
<cfset variables.day_of_week_number=dayofweek(attributes.odbc_date)>

<!---if new day is Saturday or Sunday, mark as a weekend day--->
<cfif listfind("1,7", variables.day_of_week_number)>
	<cfset variables.weekend_ind=1>
<cfelse>
	<cfset variables.weekend_ind=0>
</cfif>

<cfquery name="insert_ref_date" datasource="#application.datasources.main#">
INSERT INTO REF_Date (odbc_date, day_of_week_number, holiday_ind,
	weekend_ind, date_year, date_month,
	date_day, fiscal_year, program_year_id)
VALUES (<cfqueryparam cfsqltype="cf_sql_date" value="#createodbcdate(attributes.odbc_date)#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#variables.day_of_week_number#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.holiday_ind#">,
	<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.weekend_ind#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#year(attributes.odbc_date)#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#month(attributes.odbc_date)#">,
	<cfqueryparam cfsqltype="cf_sql_integer" value="#day(attributes.odbc_date)#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.fiscal_year#">, <cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.program_year_id#">)
</cfquery>
