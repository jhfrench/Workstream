
<!--Directory/qry_insert_demographics.cfm
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
<cfquery name="insert_demographics" datasource="#application.datasources.main#">
INSERT INTO View_Demographics_Workstream (user_account_id, uupic, hire_date,
	birth_date, supervisor,
	employee_classification_id, overtime_elligible_ind<cfif len(attributes.photo)>, photo</cfif>)
VALUES (#variables.user_account_id#, '#attributes.uupic#', #createodbcdatetime(attributes.hire_date)#,
	#createodbcdatetime(attributes.birth_date)#, <cfif listlen(attributes.supervisor_id) GT 1>#listgetat(attributes.supervisor_id, 1)#<cfelseif listlen(attributes.supervisor_id) EQ 1>#attributes.supervisor_id#<cfelse>#variables.user_identification#</cfif>,
	#attributes.employee_classification#, #attributes.overtime_elligible_ind#<cfif len(attributes.photo)>,#attributes.photo#</cfif>)
</cfquery>
