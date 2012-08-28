<!-- common_files/qry_insert_access_user_business_function.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_access_user_business_function.cfm">
	<responsibilities>
		I assign user business function access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/26/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.user_category" default="existing_user">

<cfswitch expression="#application.application_specific_settings.assign_module_access_ind#">
	<cfcase value="0"><!--- business_function --->
			<cfquery name="insert_access_user_business_function" datasource="#application.datasources.main#">
			INSERT INTO Access_User_Business_Function (user_account_id, business_function_id, created_by,
				program_year_id)
			<cfswitch expression="#attributes.user_category#">
				<cfcase value="add_user">
			SELECT #attributes.user_account_id# AS user_account_id, business_function_id, #variables.user_identification# created_by,
				REF_Date.program_year_id
			FROM REF_Business_Function, REF_Date
			WHERE REF_Date.date_year=#year(now())#
				AND REF_Date.date_month=#month(now())#
				AND REF_Date.date_day=#dateformat(now(),"d")#
				AND REF_Business_Function.active_ind=1
				AND REF_Business_Function.default_access_ind=1
				</cfcase>
				<cfcase value="existing_user">
			SELECT User_Account.user_account_id, REF_Business_Function.business_function_id, #variables.user_identification# created_by,
				REF_Date.program_year_id
			FROM User_Account
				INNER JOIN REF_Business_Function ON 1=REF_Business_Function.active_ind
				INNER JOIN REF_Date ON 1=1
				LEFT OUTER JOIN Access_User_Business_Function ON REF_Business_Function.business_function_id=Access_User_Business_Function.business_function_id
					AND Access_User_Business_Function.active_ind=1
					AND Access_User_Business_Function.user_account_id IN (#attributes.user_account_id#)
			WHERE User_Account.user_account_id IN (#attributes.user_account_id#)
				AND REF_Business_Function.business_function_id IN (#attributes.business_function_id#)
				AND REF_Business_Function.active_ind=1
				AND REF_Date.date_year=#year(now())#
				AND REF_Date.date_month=#month(now())#
				AND REF_Date.date_day=#dateformat(now(),"d")#
				AND Access_User_Business_Function.user_account_id IS NULL
				</cfcase>
			</cfswitch>
			</cfquery>
	</cfcase>
	<cfcase value="1"><!--- module --->
		<cfquery name="insert_access_user_business_function" datasource="#application.datasources.main#">
		INSERT INTO Access_User_Business_Function (user_account_id, business_function_id, created_by,
			program_year_id)
			<cfswitch expression="#attributes.user_category#">
				<cfcase value="add_user">
		SELECT User_Account.user_account_id, REF_Screen.business_function_id, #variables.user_identification#,
			REF_Date.program_year_id
		FROM User_Account, REF_Screen, REF_Date
		WHERE User_Account.user_account_id IN (#attributes.user_account_id#)
			AND REF_Screen.active_ind=1
			AND REF_Date.date_year=#year(now())#
			AND REF_Date.date_month=#month(now())#
			AND REF_Date.date_day=#dateformat(now(),"d")#
			AND REF_Screen.module_id IN (
				SELECT REF_Screen.module_id
				FROM REF_Screen
					INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
				WHERE REF_Screen.active_ind=1
					AND REF_Business_Function.active_ind=1
					AND REF_Business_Function.default_access_ind=1
				GROUP BY REF_Screen.module_id
			)
		GROUP BY User_Account.user_account_id, REF_Screen.business_function_id, REF_Date.program_year_id
				</cfcase>
				<cfcase value="existing_user">
		SELECT User_Account.user_account_id, REF_Screen.business_function_id, #variables.user_identification#,
			#attributes.program_year_id#
		FROM User_Account, REF_Screen
		WHERE User_Account.user_account_id IN (#attributes.user_account_id#)
			AND REF_Screen.active_ind=1
			AND REF_Screen.module_id IN (#attributes.module_id#)
			AND business_function_id NOT IN (
				SELECT business_function_id
				FROM REF_Screen
				WHERE active_ind=1
					AND module_id NOT IN (#attributes.module_id#)
				)
		GROUP BY User_Account.user_account_id, REF_Screen.business_function_id
				</cfcase>
			</cfswitch>
		</cfquery>
	</cfcase>
</cfswitch>