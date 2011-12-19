<!-- Administration/qry_insert_link_business_function_hier.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_business_function_hier.cfm">
	<responsibilities>
		Query to insert a record into Link_Business_Function_Hier table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/10/2007" role="FuseCoder" comments="Created File">
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
VALUES ('#attributes.business_function_id#', #attributes.l_p_y_h_id#, #session.user_account_id#,
	#attributes.required_ind#, #attributes.active_ind#)
</cfquery>