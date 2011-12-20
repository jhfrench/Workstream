<!-- Administration/qry_insert_ref_hierarchy_level.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_hierarchy_level.cfm">
	<responsibilities>
		Query to insert a new hierarchy level into REF_Hierarchy_Level table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="7/5/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_hierarchy_level" datasource="#application.datasources.main#">
INSERT INTO REF_Hierarchy_Level (description, created_by, active_ind,
	sort_order, center_ind, form_element_type_id)
VALUES ('#attributes.description#', #session.user_account_id#, #attributes.active_ind#,
	#attributes.sort_order#, #attributes.center_ind#, #attributes.form_element_type_id#)
</cfquery>