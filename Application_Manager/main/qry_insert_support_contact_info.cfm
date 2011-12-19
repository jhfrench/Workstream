<!-- Application_Manager/main/qry_insert_support_contact_info.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_support_contact_info.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the Support_Contact_Info table.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_support_contact_info" datasource="#application.datasources.application_manager#">
INSERT INTO Support_Contact_Info (support_contact_type_id, last_name, first_name,
	phone, email, date_created, 
	active_ind)
SELECT #attributes.support_contact_type_id#, '#attributes.last_name#', '#attributes.first_name#',
	'#attributes.phone#', '#attributes.email#', sysdate,
	1
FROM Dual
</cfquery>