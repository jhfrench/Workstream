<!-- Administration/qry_insert_ref_form_element_type.cfm
	Author: Lyudmila Klimenko -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_form_element_type.cfm">
	<responsibilities>
		Query to insert a new form element type into REF_Form_Element_Type table.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="8/21/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_ref_form_element_type" datasource="#application.datasources.main#">
INSERT INTO REF_Form_Element_Type (description, created_by, active_ind)
VALUES ('#attributes.description#', #session.user_account_id#, #attributes.active_ind#)
</cfquery>