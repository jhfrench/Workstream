
<!--Directory/qry_demographics_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a demographics record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
 --->
</cfsilent>
<cfparam name="attributes.overtime_elligible_ind" default="0">
<cfquery name="emp_contact_entry" datasource="#application.datasources.main#">
INSERT INTO View_Demographics_Workstream (user_account_id, ssn, hire_date,
	dob, manager_non_id, supervisor,
	employee_classification_id, overtime_elligible_ind<cfif len(attributes.photo)>, photo</cfif>)
VALUES (#variables.user_account_id#, '#attributes.ssn#', #createodbcdatetime(attributes.hire_date)#,
	#createodbcdatetime(attributes.dob)#, #attributes.manager_non_id#, <cfif listlen(attributes.supervisor_id) GT 1>#listgetat(attributes.supervisor_id, 1)#<cfelseif listlen(attributes.supervisor_id) EQ 1>#attributes.supervisor_id#<cfelse>#variables.user_identification#</cfif>,
	#attributes.employee_classification#, #attributes.overtime_elligible_ind#<cfif len(attributes.photo)>,#attributes.photo#</cfif>)
</cfquery>
<!--- 
<cfquery name="emp_contact_delete" datasource="#application.datasources.main#">
DELETE Demographics
WHERE user_account_id=#variables.user_account_id#
</cfquery>
 --->
