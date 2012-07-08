
<!--common_files/act_set_all_option.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I determine if a user has enhanced access to a busines function
	||
	Name: Jeromy French
	||
	Edits:
	$Log: 
	||
	END FUSEDOC --->
<cfset get_all_option.all_option=0>
<cfquery name="get_all_option" datasource="#application.datasources.main#">
<!--- $issue$: really need to think through if Access_User_Business_Function needs the ability to designate a user as having heightened privileges for a given business function --->
SELECT 1 AS all_option
FROM Access_User_Business_Function
WHERE active_ind=1
	AND program_year_id=#attributes.program_year_id#
	AND user_account_id=#session.user_account_id#
	AND business_function_id=#attributes.business_function_id#
</cfquery>
<cfif get_all_option.recordcount NEQ 0>
	<cfset caller.variables.all_option=get_all_option.all_option>
	<cfset variables.all_option=get_all_option.all_option>
<cfelse>
	<cfset caller.variables.all_option=0>
	<cfset variables.all_option=0>
</cfif>
</cfsilent>
