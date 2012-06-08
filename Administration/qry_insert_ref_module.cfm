<!-- Administration/qry_insert_ref_module.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_module.cfm">
	<responsibilities>
		Query to insert new module into REF_Module table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_module" datasource="#application.datasources.main#">
INSERT INTO REF_Module (description, sort_order, created_by,
	viewable_ind, assign_hier_privileges_ind, required_ind,
	active_ind)
VALUES ('#attributes.description#', #attributes.sort_order#, #session.user_account_id#,
	#attributes.viewable_ind#, #attributes.assign_hier_privileges_ind#, #attributes.required_ind#,
	#attributes.active_ind#)
</cfquery>