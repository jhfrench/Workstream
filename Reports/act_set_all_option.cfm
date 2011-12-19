
<!--Reports/act_set_all_option.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets the people for the undertime report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="get_all_option" datasource="#application.datasources.main#">
SELECT ISNULL(all_option,0) AS all_option
FROM Security_Object_Access
WHERE emp_id=#session.user_account_id#
	AND object_id=#attributes.object_id#
</cfquery>
<cfif get_all_option.recordcount NEQ 0>
	<cfset caller.variables.all_option=get_all_option.all_option>
	<cfset variables.all_option=get_all_option.all_option>
<cfelse>
	<cfset caller.variables.all_option=0>
	<cfset variables.all_option=0>
</cfif>
</cfsilent>
