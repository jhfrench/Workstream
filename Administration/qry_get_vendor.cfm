<!-- Vendor/qry_get_user_business.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_vendor.cfm">
	<responsibilities>
		I look up businesses associated with the logged-in user.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/2/2009" role="FuseCoder" comments="Created File">
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

<cfquery name="get_vendor" datasource="#application.datasources.main#">
SELECT Business.parent_business_id, Business.duns, Business.legal_name,
	Business.division_name
FROM Business
	INNER JOIN Link_Business_Contact ON Business.parent_business_id=Link_Business_Contact.parent_business_id
WHERE Business.active_ind=1
	AND Link_Business_Contact.active_ind=1
	AND Link_Business_Contact.contact_type_id=8 /*registrant*/
GROUP BY Business.parent_business_id, Business.duns, Business.legal_name,
	Business.division_name
ORDER BY Business.legal_name
</cfquery>