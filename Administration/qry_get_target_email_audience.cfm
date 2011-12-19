<!-- Administration/qry_get_target_email_audience.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_target_email_audience.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/23/2009" role="FuseCoder" comments="Created File">
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
<cfquery name="get_target_email_audience" datasource="#application.datasources.main#">
SELECT Target_Email_Audience.demographics_id, Target_Email_Audience.email_address, ISNULL(Email_Blacklist.active_ind,0) AS blacklist_ind
FROM (
<cfswitch expression="#attributes.user_type_id#">
	<cfcase value="1">
		SELECT MIN(Demographics.demographics_id) AS demographics_id, Demographics.email_address
		FROM Access_User_Business_Function
			INNER JOIN Demographics ON Access_User_Business_Function.user_account_id=Demographics.user_account_id
		WHERE Access_User_Business_Function.active_ind=1
			AND Demographics.active_ind=1
			AND Access_User_Business_Function.business_function_id=#get_screen_details.business_function_id# /*people who can manage email*/
		GROUP BY Demographics.email_address
	</cfcase>
	<cfcase value="2">
		SELECT MIN(Demographics.demographics_id) AS demographics_id, Demographics.email_address
		FROM User_Email_Subscription
			INNER JOIN Demographics ON User_Email_Subscription.user_account_id=Demographics.user_account_id
		WHERE User_Email_Subscription.active_ind=1
			AND Demographics.active_ind=1
			AND User_Email_Subscription.email_category_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.email_category_id#">)
		GROUP BY Demographics.email_address
	</cfcase>
	<cfcase value="3">
		SELECT MIN(Demographics.demographics_id) AS demographics_id, Demographics.email_address
		FROM Business
			INNER JOIN Link_Business_Contact ON Business.parent_business_id=Link_Business_Contact.parent_business_id
			INNER JOIN Demographics ON Link_Business_Contact.demographics_id=Demographics.demographics_id<cfif comparenocase(attributes.email_category_id, 0)>
			INNER JOIN (
				SELECT user_account_id
				FROM User_Email_Subscription
				WHERE active_ind=1
					AND User_Email_Subscription.email_category_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.email_category_id#">)
				GROUP BY user_account_id
			) Subscribers ON Demographics.user_account_id=Subscribers.user_account_id</cfif>
		WHERE Business.active_ind=1
			AND Link_Business_Contact.active_ind=1
			AND Demographics.active_ind=1<cfif NOT comparenocase(attributes.email_category_id, 0)>
			AND Link_Business_Contact.contact_type_id IN (1,8) /*vendor POC, registrant*/</cfif><cfif isdefined("attributes.business_category_id")>
			AND Business.parent_business_id IN (
				SELECT parent_business_id
				FROM Link_B_B_C
				WHERE active_ind=1
					AND business_category_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.business_category_id#">)
				)</cfif><cfif isdefined("attributes.naics_id")>
			AND Business.parent_business_id IN (
				SELECT parent_business_id
				FROM Link_Business_NAICS
				WHERE active_ind=1
					AND naics_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.naics_id#">)
				)</cfif><cfif isdefined("attributes.state_province_id")>
			AND Business.parent_business_id IN (
				SELECT parent_business_id
				FROM Link_Business_Address
					INNER JOIN Address ON Link_Business_Address.address_id=Address.address_id
				WHERE Link_Business_Address.active_ind=1
					AND Address.state_province_id IN (<cfqueryparam cfsqltype="cf_sql_integer" list="yes" value="#attributes.state_province_id#">)
				)</cfif>
		GROUP BY Demographics.email_address
	</cfcase>
</cfswitch>
	) Target_Email_Audience
	LEFT OUTER JOIN Email_Blacklist ON Target_Email_Audience.email_address=Email_Blacklist.email_address
		AND Email_Blacklist.active_ind=1
WHERE LTRIM(Target_Email_Audience.email_address) IS NOT NULL
ORDER BY Target_Email_Audience.email_address
</cfquery>