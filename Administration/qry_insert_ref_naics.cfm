<!--- Administration/qry_insert_ref_naics.cfm
	Author: Jeromy French--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_naics.cfm">
	<responsibilities>
		Query to insert a new naics into REF_naics table.
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

<cfquery name="insert_ref_naics" datasource="#application.datasources.main#">
INSERT INTO REF_naics (description, sort_order, created_by,
	active_ind)
VALUES ('#attributes.description#', #attributes.sort_order#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />,
	#attributes.active_ind#)
</cfquery>