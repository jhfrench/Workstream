<!--- Administration/qry_insert_ref_product_service.cfm
	Author: Jeromy French--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_product_service.cfm">
	<responsibilities>
		Query to insert a new ccr status into REF_product_service table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_product_service" datasource="#application.datasources.main#">
INSERT INTO REF_Product_Service (code, description, sort_order,
	created_by, active_ind)
VALUES ('#attributes.code#', '#attributes.description#', #attributes.sort_order#,
	<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />, #attributes.active_ind#)
</cfquery>