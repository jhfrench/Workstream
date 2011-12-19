
<!-- directory/act_update_emp.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update an employees record.

	||
	Edits: 
	$Log$
	Revision 1.1  2006/07/17 07:14:14  french
	Modified code to ensure that employee updates don't cause duplicate demographic records.

	||
	Variables:
	
	END FUSEDOC --->
<cftransaction isolation="READ_COMMITTED">
	<cfinclude template="qry_emp_contact_update.cfm">
	<cfinclude template="act_update_demographics.cfm">
	<cfinclude template="act_update_company.cfm">
	<cfinclude template="act_update_locations.cfm">
	<!--- <cfinclude template="qry_emp_supervisor_entry.cfm"> --->
	<cfinclude template="act_update_company_visible_to.cfm">
	<cfinclude template="act_update_email.cfm">
	<cfinclude template="act_update_phone.cfm">
	<cfinclude template="act_update_emp_bio.cfm">
</cftransaction>
<cfset application.team_changed=now()>

<cfset attributes.action="index.cfm?fuseaction=employee_details">
<cfset attributes.fields="emp_id">
<cfinclude template="../common_files/act_forward_browser.cfm">
