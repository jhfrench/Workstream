<!-- Administration/act_copy_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_copy_user_access.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/14/2007" role="FuseCoder" comments="Created File">
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
<!--- deactivate old assignments --->
<cfquery name="deactivate_access_user_account_grouper" datasource="#application.datasources.main#">
UPDATE Access_User_Business_Function
SET active_ind=0
WHERE active_ind=1
	AND user_account_id IN (#attributes.target_user_account_id#)
</cfquery>
<!--- insert new --->
<cfquery name="deactivate_access_user_account_grouper" datasource="#application.datasources.main#">
INSERT INTO Access_User_Business_Function (user_account_id, program_year_id, business_function_id,
	created_by)
SELECT User_Account.user_account_id, program_year_id, business_function_id,
	#variables.user_identification#
FROM Access_User_Business_Function
	INNER JOIN Link_User_Account_Status ON Access_User_Business_Function.active_ind=Link_User_Account_Status.active_ind
	INNER JOIN User_Account ON User_Account.user_account_id=Link_User_Account_Status.user_account_id
WHERE Access_User_Business_Function.active_ind=1
	AND Access_User_Business_Function.user_account_id=#attributes.source_user_account_id#
	AND User_Account.user_account_id IN (#attributes.target_user_account_id#)
</cfquery>

<!--- system privileges --->
<!--- deactivate old assignments --->
<cfquery name="deactivate_access_user_account_grouper" datasource="#application.datasources.main#">
UPDATE Access_User_Account_Grouper
SET active_ind=0
WHERE active_ind=1
	AND user_account_id IN (#attributes.target_user_account_id#)
</cfquery>
<!--- insert new --->
<cfquery name="deactivate_access_user_account_grouper" datasource="#application.datasources.main#">
INSERT INTO Access_User_Account_Grouper (user_account_id, program_year_id, module_id,
	organization_id, center_id, privilege_id,
	created_by)
SELECT User_Account.user_account_id, program_year_id, module_id,
	organization_id, center_id, privilege_id,
	#variables.user_identification#
FROM Access_User_Account_Grouper
	INNER JOIN Link_User_Account_Status ON Access_User_Account_Grouper.active_ind=Link_User_Account_Status.active_ind
	INNER JOIN User_Account ON User_Account.user_account_id=Link_User_Account_Status.user_account_id
WHERE Access_User_Account_Grouper.active_ind=1
	AND Access_User_Account_Grouper.user_account_id=#attributes.source_user_account_id#
	AND User_Account.user_account_id IN (#attributes.target_user_account_id#)
</cfquery>