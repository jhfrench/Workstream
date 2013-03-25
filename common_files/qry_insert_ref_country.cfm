<!-- common_files/qry_get_ref_country.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_country.cfm">
	<responsibilities>
		I create a REF_Country record.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/1/2009" role="FuseCoder" comments="Created File">
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
<cfquery name="insert_ref_country" datasource="#application.datasources.main#">
INSERT INTO REF_Country (description, code, created_by)
VALUES ('#attributes.description#', '#attributes.code#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfquery>