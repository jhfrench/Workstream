
<!-- Directory/act_update_emp.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update an employees record.

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
</cfsilent>
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="qry_update_employee_demographics.cfm">
	<cfinclude template="act_update_demographics.cfm">
	<cfinclude template="act_update_company.cfm">
	<cfinclude template="act_update_locations.cfm">
	<!--- <cfinclude template="qry_emp_supervisor_entry.cfm"> --->
	<cfinclude template="act_update_security_company_access.cfm">
	<cfinclude template="act_update_email.cfm">
	<cfinclude template="act_update_phone.cfm">
	<cfinclude template="act_update_emp_bio.cfm">
</cftransaction>
<cfset application.team_changed=now()>

<cfset attributes.action="index.cfm?fuseaction=Directory.employee_details">
<cfset attributes.fields="user_account_id">
<cfinclude template="../common_files/act_forward_browser.cfm">
