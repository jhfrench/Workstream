<!-- common_files/qry_get_current_program_year.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_current_program_year.cfm">
	<responsibilities>
		I retrieve current program year from REF_Program_Year table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/11/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_current_program_year" datasource="#application.datasources.main#">
<cfif isdefined("session.program_year_id")>
SELECT program_year_id, description AS fiscal_year
FROM REF_Program_Year
WHERE program_year_id=#session.program_year_id# /*(session)*/
<cfelse>
SELECT program_year_id, fiscal_year /*AS description rename any variable that breaks*/
FROM REF_Date
WHERE odbc_date=#createodbcdate(now())#
</cfif>
</cfquery>

<cfparam name="attributes.program_year_id" default="#get_current_program_year.program_year_id#">
