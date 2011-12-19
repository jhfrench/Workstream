
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
<cfquery name="emp_contact_entry" datasource="#application.datasources.main#">
INSERT INTO Demographics_Ngauge (NT_User_name, emp_id, ssn,
	pin, hire_date, dob,
	manager_non_id, supervisor<cfif len(attributes.photo)>, photo</cfif>,
	employee_classification_id, effective_from, Overtime<cfif len(attributes.employee_type)>,
	employee_type_id</cfif>)
VALUES ('#attributes.lname#', #variables.emp_id#, '#attributes.ssn#',
	'#attributes.pin#', #createodbcdatetime(attributes.hire_date)#, #createodbcdatetime(attributes.dob)#,#attributes.manager_non_id#,<cfif listlen(attributes.supervisor_id) GT 1>#listgetat(attributes.supervisor_id, 1)#<cfelseif listlen(attributes.supervisor_id) EQ 1>#attributes.supervisor_id#<cfelse>#session.user_account_id#</cfif><cfif len(attributes.photo)>,#attributes.photo#</cfif>,#attributes.employee_classification#,#createodbcdatetime(attributes.hire_date)#,#overtime#<cfif len(attributes.employee_type)>, #attributes.employee_type#</cfif>)
</cfquery><!--- 
<cfquery name="emp_contact_delete" datasource="#application.datasources.main#">
DELETE Demographics
WHERE emp_id=#variables.emp_id#
</cfquery> --->

