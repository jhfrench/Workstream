
<!--Directory/qry_insert_employee.cfm
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
<cfquery name="insert_employee" datasource="#application.datasources.main#">
INSERT INTO Employee (user_account_id, uupic, hire_date,
	birth_date, employee_classification_id, overtime_elligible_ind<cfif len(attributes.photo)>,
	photo_path</cfif>)
VALUES (#variables.user_account_id#, '#attributes.uupic#', #createodbcdatetime(attributes.hire_date)#,
	#createodbcdatetime(attributes.birth_date)#, #attributes.employee_classification#, #attributes.overtime_elligible_ind#<cfif len(attributes.photo)>,
	#attributes.photo#</cfif>);
	
INSERT INTO Link_Employee_Supervisor (user_account_id, supervisor_id, date_start)
VALUES (#variables.user_account_id#, <cfif listlen(attributes.supervisor_id) GT 1>#listgetat(attributes.supervisor_id, 1)#<cfelseif listlen(attributes.supervisor_id) EQ 1>#attributes.supervisor_id#<cfelse>#variables.user_identification#</cfif>, CURRENT_TIMESTAMP);
</cfquery>
