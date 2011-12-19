<!-- Administration/qry_get_accounts_to_deactivate.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_accounts_to_deactivate.cfm">
	<responsibilities>
		I get the passwords that are about to expire.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_accounts_to_deactivate" datasource="#application.datasources.main#">
SELECT Demographics.user_account_id, Demographics.email_address
FROM User_Password
	INNER JOIN Demographics ON User_Password.user_account_id=Demographics.user_account_id
	INNER JOIN Link_User_Account_Status ON User_Password.user_account_id=Link_User_Account_Status.user_account_id
WHERE User_Password.active_ind=1
	AND Demographics.active_ind=1
	AND Link_User_Account_Status.active_ind=1
	AND Link_User_Account_Status.account_status_id=2
	AND 90-TRUNC(SYSDATE-User_Password.created_date) < -180
	/*Vendor registrations only need to renew once a year*/
	AND Demographics.demographics_id NOT IN (
		SELECT demographics_id
		FROM Business
			INNER JOIN Link_Business_Contact ON Business.parent_business_id=Link_Business_Contact.parent_business_id
		WHERE Business.active_ind=1
			AND Link_Business_Contact.active_ind=1
			AND Link_Business_Contact.contact_type_id=8
	)
</cfquery>
