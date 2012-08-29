<!-- Application_Manager/main/qry_get_ref_support_contact_type.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_ref_support_contact_type.cfm" Specification="2.0">
	<responsibilities>
		I retrieve a list of the defined support contact types.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_ref_support_contact_type" datasource="#application.datasources.application_manager#">
SELECT *
FROM REF_Support_Contact_Type
WHERE active_ind=1
ORDER BY sort_order
</cfquery>