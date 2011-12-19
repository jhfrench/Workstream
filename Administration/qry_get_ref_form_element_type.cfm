<!-- Administration/qry_get_ref_form_element_type.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_form_element_type.cfm">
	<responsibilities>
		Query to get form element type.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/20/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="form_element_type_id" default="0">

<cfquery name="get_ref_form_element_type" datasource="#application.datasources.main#">
SELECT form_element_type_id, description AS form_element_type_description
FROM REF_Form_Element_Type
WHERE 
<cfif attributes.form_element_type_id NEQ 0>form_element_type_id=#attributes.form_element_type_id#<cfelse>active_ind=1</cfif>
ORDER BY description
</cfquery>

<cfset caller.get_ref_form_element_type=get_ref_form_element_type>