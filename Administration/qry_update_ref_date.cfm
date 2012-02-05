<!--Administration/qry_update_ref_date.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_update_ref_date.cfm">
	<responsibilities>
		I update a specified date.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/4/10" role="FuseCoder" comments="Created File">
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
<cfquery name="update_ref_date" datasource="#application.datasources.main#">
UPDATE REF_Date
SET holiday_ind=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.holiday_ind#">,
	fiscal_year=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.fiscal_year#">,
	program_year_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.program_year_id#">
WHERE 1=1<cfif attributes.date_id NEQ 0>
	AND date_id=#attributes.date_id#<cfelse>
	AND odbc_date=#createodbcdate(attributes.odbc_date)#</cfif>
</cfquery>