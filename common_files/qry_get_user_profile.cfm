
<!--common_files/qry_get_user_profile.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
 --->
<cfquery name="get_user_profile" datasource="#application.datasources.main#">
SELECT *
FROM User_Profile
WHERE active_ind=1
	AND user_account_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#variables.user_identification#">
	<cfif isdefined("attributes.fuseaction")>
		<cfif isdefined("attributes.user_profile_id")>AND user_profile_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.user_profile_id#"></cfif>
		<cfif comparenocase(listlast(attributes.fuseaction, '.'),"load_profile") AND isdefined("attributes.profile_name")>AND profile_name=<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.profile_name#"><cfelse>
ORDER BY profile_name</cfif>
	<cfelse>
	AND primary_profile_ind=1
	</cfif>
</cfquery>
</cfsilent>