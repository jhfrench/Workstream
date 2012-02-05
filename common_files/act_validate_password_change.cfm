<!-- common_files/act_validate_password_change.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="act_validate_password_change.cfm">
	<responsibilities>
		I process the password supplied to be sure it meets standards (like it has not been used within the last ten time, entered password matches confirm password etc) when changing passwords
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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



<!--- if old password is defined, which only happens if the user is changing their own password, check old password --->
<cfif len(attributes.old_password)>
	<!--- run a query to verify the old password provided by the user --->
	<cfinclude template="qry_get_user_password.cfm">

	<!--- encrypt old password --->
	<cfmodule template="act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#attributes.old_password#" user_account_id="#attributes.user_account_id#" password_created_date="#get_user_password.account_created_date#">
	<cfif NOT compare(get_user_password.password, variables.encrypted_password)>
		<!--- encrypt new password --->
		<cfmodule template="act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#attributes.password#" user_account_id="#attributes.user_account_id#" password_created_date="#get_user_password.account_created_date#">
		<cfinclude template="act_process_password.cfm">
	<cfelse>
		<cfset variables.password_accepted_ind=0>
		<cfset variables.display_message="<li>The current password you entered is not correct.">
	</cfif>
<cfelse>
	<cfinclude template="act_process_password.cfm">
</cfif>
