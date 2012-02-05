<!-- common_files/act_encrypt.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_encrypt.cfm">
	<responsibilities>
		I do the encryption process.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Omoniyi Fajemidupe" type="create" date="6/5/2007" role="FuseCoder" comments="Created File">
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

<!--- creating an encryption template --->
<cfparam name="attributes.encryption_type" default="">
<cfswitch expression="#attributes.encryption_type#">
	<cfcase value="password_encryption">
		<cfparam name="attributes.string_to_encrypt" default="">
		<cfif NOT isdefined("attributes.user_account_id") OR NOT len(attributes.user_account_id)>
			<cfset attributes.user_account_id=0>
			<cfparam name="attributes.password_created_date" default="#now()#">
		<cfelse>
			<cfquery name="get_user_information" datasource="#application.datasources.main#">
			SELECT User_Account.created_date
			FROM User_Account
			WHERE User_Account.user_account_id=#attributes.user_account_id#
			</cfquery>
			<cfparam name="attributes.password_created_date" default="#get_user_information.created_date#">
		</cfif>
		<cfset variables.secret_key="#trim(attributes.user_account_id)##dateformat(attributes.password_created_date, 'yyyymmdd')#">
		<cfset caller.variables.encrypted_password=cfusion_encrypt(attributes.string_to_encrypt, variables.secret_key)>
	</cfcase>
</cfswitch>
