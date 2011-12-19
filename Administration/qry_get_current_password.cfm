
<!--admin/qry_get_current_password.cfm
	Author: Victor B-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Page allows user to reset their password after verifying their current password.
	||
	Name: Victor Blell
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->

	
	
<!------------------------------------------------------------------ 

Use DAF to encrypt the current password and new password

------------------------------------------------------------------->
<cfparam name="variables.password_change" default="false">
</cfsilent>
<cfset DAFCrypto = CreateObject("com","dafcrypt.dafcrypt.1")>

<cfif isdefined("attributes.current_pass") and len(attributes.current_pass)>
	<cfset variables.current_pass=DAFCrypto.DAFDBEncrypt('#attributes.current_pass#', '#attributes.current_pass#')>
<cfelse>
	<cfset variables.current_pass=attributes.old_password>
</cfif>

<cfquery name="get_Current_Password" datasource="#application.datasources.main#">
	SELECT username, Password
	FROM Security
	WHERE password= '#variables.current_pass#'
	<cfif isdefined("attributes.make_changes")>
		AND emp_id = '#attributes.emp_id#'
	<cfelse>
		AND emp_id = '#session.user_account_id#'
	</cfif>
</cfquery>


<cfif isdefined("attributes.new_pass") and len(attributes.new_pass)>
	<cfset variables.new_pass=DAFCrypto.DAFDBEncrypt('#Get_Current_Password.username#', '#attributes.new_pass#')>
	<cfset variables.password_change=true>
<cfelse>
	<cfset variables.new_pass=attributes.old_password>
</cfif>

<cfset attributes.password=attributes.new_pass>


