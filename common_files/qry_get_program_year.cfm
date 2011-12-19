<!--common_files/qry_get_program_year.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_program_year.cfm">
	<responsibilities>
		I display active years in the system.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="6/25/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.program_year_id" default="0">
<cfparam name="attributes.exclude_future_years_ind" default="1">
<cfquery name="get_program_year" datasource="#application.datasources.main#">
SELECT program_year_id, description, sort_order
FROM REF_Program_Year
WHERE active_ind=1<cfif attributes.program_year_id NEQ 0>
	AND program_year_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.program_year_id#">
	<cfelseif attributes.exclude_future_years_ind>
	AND description <=(
		SELECT fiscal_year
		FROM REF_Date
		WHERE odbc_date=#createodbcdate(now())#
	) /*Only show current and past years*/
	</cfif>
ORDER BY sort_order DESC
</cfquery>
<cfset caller.get_program_year=get_program_year>
