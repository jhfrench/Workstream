<!-- Administration/qry_insert_ref_form_element_type.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_ref_form_element_type.cfm">
	<responsibilities>
		Query to insert a new form element type into REF_Form_Element_Type table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/21/2007" role="FuseCoder" comments="Created File">
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
VALUES ('#attributes.description#', #variables.user_identification#, #attributes.active_ind#)
</cfquery>