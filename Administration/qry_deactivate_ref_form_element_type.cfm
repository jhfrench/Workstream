<!-- Administration/qry_deactivate_ref_form_element_type.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_ref_form_element_type.cfm">
	<responsibilities>
		Query to deactivate a record in REF_Form_Element_Type table before a new insert.
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

<cfquery name="deactivate_ref_form_element_type" datasource="#application.datasources.main#">
UPDATE REF_Form_Element_Type
SET active_ind=0
WHERE active_ind=1
	AND form_element_type_id=#attributes.form_element_type_id#
</cfquery>
