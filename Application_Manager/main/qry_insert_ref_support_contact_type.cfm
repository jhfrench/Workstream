<!-- Application_Manager/main/qry_insert_ref_support_contact_type.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_ref_support_contact_type.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the REF_Support_Contact_Type table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_ref_support_contact_type" datasource="#application.datasources.main#">
INSERT INTO REF_Support_Contact_Type (support_contact_type_name, sort_order, active_ind)
VALUES ('#attributes.support_contact_type_name#', 1, 1)
</cfquery>