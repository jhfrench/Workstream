<!-- Administration/pag_copy_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_copy_user_access.cfm">
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

<cfparam name="attributes.method" default="">
<cfparam name="attributes.display_message" default="">
<cfparam name="attributes.source_user_account_id" default="0">

<cfif isdefined("attributes.target_user_account_id")>
<!--- system screen access --->
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
	<div class="alert alert-info">
	The access has been copied.
	</div>
<cfelse>
	<cfif attributes.source_user_account_id NEQ 0>
		<cfset variables.form_element_type="checkbox">
		<cfset variables.form_element_label="target_user_account_id">
		<cfset variables.submit_label="Apply access to these users">
	<cfelse>
		<cfset variables.form_element_type="radio">
		<cfset variables.form_element_label="source_user_account_id">
		<cfset variables.submit_label="Copy User">
	</cfif>
	<!--- include all user query --->
	<cfinclude template="../common_files/qry_get_user_information.cfm">
	<cfinclude template="dsp_copy_user_access.cfm">
</cfif>