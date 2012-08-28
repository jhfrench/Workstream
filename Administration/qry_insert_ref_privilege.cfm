<!-- Administration/qry_insert_ref_privilege.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_privilege.cfm">
	<responsibilities>
		Query to insert a new record into REF_Privilege table.
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
<cfquery name="insert_ref_privilege" datasource="#application.datasources.main#">
INSERT INTO REF_Privilege (description, sort_order, created_by,
	active_ind)
VALUES ('#attributes.description#', #attributes.sort_order#, #variables.user_identification#,
	#attributes.active_ind#)
</cfquery>