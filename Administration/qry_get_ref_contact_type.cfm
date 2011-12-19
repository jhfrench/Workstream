<!-- Administration/pag_edit_ref_priority.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_ref_contact_type.cfm">
	<responsibilities>
		I display the form for editing priority and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.contact_type_id" default="0">
<cfquery name="get_ref_contact_type" datasource="#application.datasources.main#">
SELECT contact_type_id, description, sort_order
FROM REF_contact_type
WHERE <cfif attributes.contact_type_id NEQ 0>contact_type_id=#attributes.contact_type_id#<cfelse>active_ind=1</cfif>
ORDER BY sort_order
</cfquery>
<cfset caller.get_ref_contact_type=get_ref_contact_type>