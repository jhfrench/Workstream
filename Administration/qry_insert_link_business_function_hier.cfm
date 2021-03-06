<!-- Administration/qry_insert_link_business_function_hier.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_business_function_hier.cfm">
	<responsibilities>
		Query to insert a record into Link_Business_Function_Hier table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_link_business_function_hier" datasource="#application.datasources.main#">
INSERT INTO Link_Business_Function_Hier (business_function_id, l_p_y_h_id, created_by,
	required_ind, active_ind)
VALUES ('#attributes.business_function_id#', #attributes.l_p_y_h_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />,
	#attributes.required_ind#, #attributes.active_ind#)
</cfquery>