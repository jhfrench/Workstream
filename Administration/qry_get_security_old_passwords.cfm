<!--- admin/qry_get_security_old_passwords.cfm
	author: Victor B --->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I query the password history table for a specific user.
	||
	Name: Victor Blell
	||
	Edits:
	$Log$
	||
	--> attributes.new_pass: string returned from sbmitting form
	--> attributes.conf_pass: string returned from sbmitting form
	++> session.user_account_id: number associated with a particular user
	END FUSEDOC --->

	
<!--- query for old passwords, retrieve max rows based on application.password_history --->
<cfquery name="get_security_old_passwords"  datasource="#application.datasources.main#">
SELECT password,date_created
from security_old_passwords
where password = '#variables.new_pass#'
<cfif isdefined("attributes.make_changes")>
	AND emp_id = '#attributes.emp_id#'
<cfelse>
	AND emp_id = '#session.user_account_id#'
</cfif>
</cfquery>