
<!--Directory/act_enter_employee.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I call the queries that are used to enter a new workstream user. If provided, I upload the provided image and convert the image path into a name to be used in the demographics table. Then I make an entry into the emp_contact table, where I also retrieve the emp_id for the new record. Using this emp_id I make entries into the demographics, company, location, supervisor, security, Security_Company_Access, email_phone and emp_biography tables.
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
	<cfinclude template="qry_emp_contact_entry.cfm">
	<cfinclude template="qry_demographics_entry.cfm">
	<cfinclude template="qry_company_entry.cfm">
	<cfinclude template="qry_location_entry.cfm">
	<!--- <cfset need_all_supervisors = 1> --->
	<cfinclude template="qry_get_present_supervisor.cfm">
	<cfinclude template="qry_emp_supervisor_entry.cfm">
	<cfinclude template="qry_Security_Company_Access_entry.cfm">
	<cfinclude template="qry_email_entry.cfm">
	<cfinclude template="qry_phone_entry.cfm">
	<cfinclude template="qry_emp_biography_entry.cfm">
	<cfinclude template="qry_pto_rollover_entry.cfm">
	<cfinclude template="qry_position_number_entry.cfm">

	<cfset application.team_changed=now()>
</cftransaction>

