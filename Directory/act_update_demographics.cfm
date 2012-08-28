
<!-- path/act_update_demographics.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the demographics record for an employee

	||
	Edits: 
	$Log$
	Revision 1.1  2006/07/17 07:14:13  french
	Modified code to ensure that employee updates don't cause duplicate demographic records.

	||
	Variables:

	END FUSEDOC --->
<cfquery name="end_demog_record" datasource="#application.datasources.main#">
UPDATE Demographics
SET effective_to=#createodbcdate(dateadd("d", -1, attributes.effective_from))#
WHERE emp_id=#attributes.emp_id# 
	AND effective_to IS NULL
</cfquery>

<cfquery name="new_demog_record" datasource="#application.datasources.main#">
INSERT INTO Demographics (nt_user_name, emp_id, ssn,
	pin, hire_date, dob,
	manager_non_id, supervisor<cfif len(attributes.photo)>, photo</cfif>,
	employee_classification_id, effective_from<cfif len(attributes.employee_type)>, employee_type_id</cfif>)
VALUES ('#attributes.lname#', #attributes.emp_id#, '#attributes.ssn#',
	'#attributes.pin#', #createodbcdatetime(attributes.hire_date)#, #createodbcdatetime(attributes.dob)#,
	#attributes.manager_non_id#, <cfif isdefined("attributes.supervisor_id") AND listlen(attributes.supervisor_id) GT 1>#listgetat(attributes.supervisor_id, 1)#<cfelseif isdefined("attributes.supervisor_id") AND listlen(attributes.supervisor_id) EQ 1>#attributes.supervisor_id#<cfelse>#variables.user_identification#</cfif><cfif len(attributes.photo)>, '#attributes.photo#'</cfif>,
	#attributes.employee_classification#, #createodbcdatetime(attributes.effective_from)#<cfif len(attributes.employee_type)>, #attributes.employee_type#</cfif>)
</cfquery>
</cfsilent>
