<!-- Application_Manager/main/qry_insert_l_installation_support_contact.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_insert_l_installation_support_contact.cfm" Specification="2.0">
	<responsibilities>
		I insert new records into the L_Installation_Support_Contact table. This table is a crosswalk table that links Installation records with one or more Support_Contact records.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_insert_l_installation_support_contact" datasource="#application.datasources.main#">
INSERT INTO L_Installation_Support_Contact (installation_id, support_contact_info_id, send_email_ind,
	notes, sort_order, date_created,
	active_ind)
SELECT #attributes.installation_id#, #support_contact_info_id_ii#, 1,
	'', 1, GETDATE(),
	1
FROM Dual
</cfquery>