<!-- common_files/qry_get_relevant_users.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_relevant_users.cfm">
	<responsibilities>
		I look up demographics information that matches a specified profile.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="10/8/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_relevant_users" datasource="#application.datasources.main#">
SELECT *
FROM Demographics
	INNER JOIN Link_User_Account_Status ON Demographics.user_account_id=Link_User_Account_Status.user_account_id
WHERE Demographics.active_ind=1
	AND Link_User_Account_Status.active_ind=1<cfif len(attributes.last_name)>
	AND UPPER(Demographics.last_name) LIKE UPPER('%#attributes.last_name#%')</cfif><cfif len(attributes.first_name)>
	AND UPPER(Demographics.first_name) LIKE UPPER('%#attributes.first_name#%')</cfif><cfif isdefined("attributes.center_id")>
	AND Demographics.center_id IN (#attributes.center_id#)</cfif><cfif isdefined("attributes.account_status_id")>
	AND Link_User_Account_Status.account_status_id IN (#attributes.account_status_id#)</cfif>
</cfquery>