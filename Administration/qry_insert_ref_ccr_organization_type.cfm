<!-- Administration/qry_insert_ref_priority.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_ccr_organization_type.cfm">
	<responsibilities>
		Query to insert a new priority into REF_Priority table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_ccr_organization_type" datasource="#application.datasources.main#">
INSERT INTO REF_CCR_Organization_Type (description, sort_order, created_by,
	active_ind)
VALUES ('#attributes.description#', #attributes.sort_order#, #variables.user_identification#,
	#attributes.active_ind#)
</cfquery>