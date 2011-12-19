<!-- common_files/act_encrypt.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_encrypt.cfm">
	<responsibilities>
		I do the encryption process.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/5/2007" role="FuseCoder" comments="Created File">
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
		</cfif>
		<cfparam name="attributes.password_created_date" default="#now()#">
		<cfset variables.secret_key="#trim(attributes.user_account_id)##dateformat(attributes.password_created_date, 'yyyymmdd')#">
		<cfset caller.variables.encrypted_password=cfusion_encrypt(attributes.string_to_encrypt, variables.secret_key)>
	</cfcase>
</cfswitch>
