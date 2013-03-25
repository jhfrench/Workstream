<!-- common_files/qry_get_ref_state_province.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_state_province.cfm">
	<responsibilities>
		I retrieve REF_State records.
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
<cfquery name="insert_ref_state_province" datasource="#application.datasources.main#">
INSERT INTO REF_State_Province (description, code, created_by)
VALUES ('#attributes.description#', '#attributes.code#', <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfquery>