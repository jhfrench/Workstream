<!-- Application_Manager/qry_get_application_support_contacts.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_application_support_contacts.cfm" Specification="2.0">
	<responsibilities>
		I retrieve the people assigned to support a given application.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_application_support_contacts" cachedwithin="#createtimespan(30, 0, 0, 0)#" datasource="#application.datasources.application_manager#">
SELECT L_Installation_Support_Contact.l_i_s_c_id, L_Installation_Support_Contact.send_email_ind, L_Installation_Support_Contact.notes,
	L_Installation_Support_Contact.display_contact_ind, Support_Contact_Info.last_name, Support_Contact_Info.first_name, 
	Support_Contact_Info.phone, Support_Contact_Info.email, Support_Contact_Info.support_contact_type_id, 
	REF_Support_Contact_Type.support_contact_type_name, REPLACE(REF_Support_Contact_Type.support_contact_type_name, ' ', '_') AS structure_contact_label
FROM L_Installation_Support_Contact
	INNER JOIN Support_Contact_Info ON L_Installation_Support_Contact.support_contact_info_id=Support_Contact_Info.support_contact_info_id
	INNER JOIN REF_Support_Contact_Type ON Support_Contact_Info.support_contact_type_id=REF_Support_Contact_Type.support_contact_type_id
WHERE L_Installation_Support_Contact.active_ind=1
	AND Support_Contact_Info.active_ind=1
	AND <cfqueryparam value="#variables.application_last_updated#" cfsqltype="cf_sql_timestamp" />=<cfqueryparam value="#variables.application_last_updated#" cfsqltype="cf_sql_timestamp" /> <!--- date comes from Last_Updated.last_updated in Application_Manager --->
	AND L_Installation_Support_Contact.installation_id=<cfqueryparam value="#application.installation_id#" cfsqltype="cf_sql_integer" />
ORDER BY REF_Support_Contact_Type.support_contact_type_name, L_Installation_Support_Contact.sort_order
</cfquery>