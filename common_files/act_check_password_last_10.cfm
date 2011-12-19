<!-- common_files/act_check_password_last_10.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_check_password_last_10.cfm">
	<responsibilities>
		I check password to see if it has been used by a specified account within that user's last 10 passwords.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/12/2007" role="FuseCoder" comments="Created File">
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

<cfset variables.password_last_10_check_passes=0>
<!--- encrypt the password and return the encrypted value --->
<cfmodule template="act_encrypt.cfm" encryption_type="password_encryption" string_to_encrypt="#attributes.password#" user_account_id="#attributes.user_account_id#">

<!--- see if attempted password has been used in the last 10 passwords --->
<cfinclude template="qry_get_last_10_passwords.cfm">

<cfif get_last_10_passwords.recordcount EQ 0>
	<cfset variables.password_last_10_check_passes=1>
</cfif>