
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
	Revision 1.1  2006/09/15 22:25:54  csy
	<>

	Revision 1.0  2006-08-16 09:32:12-04  csy
	Initial revision

	Revision 1.0  2005-02-15 15:27:40-05  daugherty
	Initial revision

	Revision 1.1  2003-04-17 16:17:50-04  blell
	checked for attributes.new_pass, if its defined and has len then change the password.

	Revision 1.0  2003-04-15 10:13:49-04  blell
	initial creation.


	
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
</CFQUERY>


<cfif isdefined("attributes.new_pass") and len(attributes.new_pass)>
	<cfset variables.new_pass=DAFCrypto.DAFDBEncrypt('#Get_Current_Password.username#', '#attributes.new_pass#')>
	<cfset variables.password_change=true>
<cfelse>
	<cfset variables.new_pass=attributes.old_password>
</cfif>

<cfset attributes.password=attributes.new_pass>


