/* common_files/sql_get_access_user_account_grouper.cfm
	Author: Jeromy French */
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="sql_get_access_user_account_grouper.cfm">
	<responsibilities>
		I return a given user's access for a specific program year and module
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="3/15/2009" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.module_id" default="2">
<cfparam name="attributes.privilege_id" default="1,2">
<cfparam name="attributes.program_year_id" default="1">
<cfoutput>
SELECT organization_id<cfloop list="#attributes.privilege_id#" index="variables.privilege_id">,
	SUM(CASE WHEN Access_User_Account_Grouper.privilege_id=#variables.privilege_id# THEN 1 ELSE 0 END) AS privilege_#variables.privilege_id#_ind</cfloop>
FROM Access_User_Account_Grouper
WHERE Access_User_Account_Grouper.active_ind=1
	AND Access_User_Account_Grouper.program_year_id=#attributes.program_year_id#
	AND Access_User_Account_Grouper.privilege_id IN (#attributes.privilege_id#)
	AND Access_User_Account_Grouper.module_id=#attributes.module_id#
	AND Access_User_Account_Grouper.user_account_id=#variables.user_identification#
GROUP BY organization_id
</cfoutput>