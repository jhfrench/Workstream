<!-- Application_Manager/main/qry_get_support_contact_info.cfm
	Author: Jeromy F -->
<!---
<fusedoc language="ColdFusion MX" FUSE="qry_get_support_contact_info.cfm" Specification="2.0">
	<responsibilities>
		I retrieve details about all the support contacts.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="1/25/2007" role="FuseCoder" comments="Created File">
			$Id$
		</history>
	</properties>
</fusedoc>
--->

<cfquery name="qry_get_support_contact_info" datasource="#application.datasources.main#">
SELECT Support_Contact_Info.support_contact_info_id, Support_Contact_Info.last_name+', '+Support_Contact_Info.first_name AS contact_name, REF_Support_Contact_Type.support_contact_type_name
FROM Support_Contact_Info
	LEFT OUTER JOIN REF_Support_Contact_Type ON Support_Contact_Info.support_contact_type_id=REF_Support_Contact_Type.support_contact_type_id
WHERE Support_Contact_Info.active_ind=1
ORDER BY Support_Contact_Info.last_name, Support_Contact_Info.first_name
</cfquery>