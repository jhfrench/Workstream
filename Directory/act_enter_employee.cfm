
<!--Directory/act_enter_employee.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I call the queries that are used to enter a new workstream user. If provided, I upload the provided image and convert the image path into a name to be used in the demographics table. Then I make an entry into the user_account table, where I also retrieve the user_account_id for the new record. Using this user_account_id I make entries into the demographics, company, location, supervisor, security, Security_Company_Access, email_phone and emp_biography tables.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
</cfsilent>
<!--- <cfset variables.destination="#replace(cgi.PATH_TRANSLATED, listchangedelims(cgi.SCRIPT_NAME, "\", "/"),"")#isay\Create\upload.cfm">
<cffile action="UPLOAD" destination="#variables.destination#" filefield="photo" nameconflict="MAKEUNIQUE" accept="image/*">
<cfset photo=file.serverfile> --->
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="qry_insert_employee_account.cfm">
	<cfinclude template="qry_insert_employee.cfm">
	<cfinclude template="qry_insert_link_company_user_account.cfm">
	<cfinclude template="qry_insert_location.cfm">
	<!--- <cfset need_all_supervisors = 1> --->
	<cfinclude template="qry_get_supervisor_history.cfm">
	<cfinclude template="qry_get_present_supervisor.cfm">
	<cfinclude template="qry_insert_link_user_account_supervisor.cfm">
	<cfinclude template="qry_insert_security_company_access.cfm">
	<cfinclude template="qry_insert_email.cfm">
	<cfinclude template="qry_insert_phone.cfm">
	<cfinclude template="qry_insert_emp_biography.cfm">
	<cfinclude template="qry_insert_pto_rollover.cfm">
	<cfinclude template="qry_insert_link_user_account_employment_position.cfm">

	<cfset application.team_changed=now()>
</cftransaction>
