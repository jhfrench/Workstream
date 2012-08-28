
<!--common_files/act_set_all_option.cfm
	Author: Jeromy F -->
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
<cfset variables.all_option=0>
<cfparam name="attributes.program_year_id" default="#session.program_year_id#">
<cfquery name="get_all_option" datasource="#application.datasources.main#">
<!--- $issue$: really need to think through if Access_User_Business_Function needs the ability to designate a user as having heightened privileges for a given business function; make use of Link_*_Privilege? --->
SELECT 1 AS all_option
FROM Access_User_Business_Function
WHERE active_ind=1
	AND program_year_id=#attributes.program_year_id#
	AND user_account_id=#variables.user_identification#
	AND business_function_id<cfif isdefined("attributes.business_function_id")>=#attributes.business_function_id#<cfelseif isdefined("attributes.fuseaction")> IN (
		SELECT business_function_id
		FROM REF_Screen
		WHERE fuseaction='#attributes.fuseaction#'
		GROUP BY business_function_id
	)</cfif>
</cfquery>
<cfif get_all_option.recordcount NEQ 0>
	<cfset variables.all_option=get_all_option.all_option>
</cfif>
<cfset caller.variables.all_option=variables.all_option>
</cfsilent>
