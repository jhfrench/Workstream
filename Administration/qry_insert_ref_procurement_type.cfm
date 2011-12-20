<!-- Administration/qry_insert_ref_procurement_type.cfm
	Author: Lyudmila Klimenko-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_procurement_type.cfm">
	<responsibilities>
		Query to insert a new procurement type into REF_Procurement_Type table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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
<cfquery name="insert_ref_procurement_type" datasource="#application.datasources.main#">
INSERT INTO REF_Procurement_Type (description, sort_order, created_by,
	active_ind, procurement_ind, abbreviation)
VALUES ('#attributes.description#', #attributes.sort_order#, #session.user_account_id#,
	#attributes.active_ind#, #attributes.procurement_ind#, '#attributes.abbreviation#')
</cfquery>