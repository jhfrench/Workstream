
<!--common_files/qry_profile_lookup.cfm
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
<cfquery name="profile_lookup" datasource="#application.datasources.main#">
SELECT *
FROM User_Profile
WHERE emp_id=#variables.user_identification#
	<cfif isdefined("attributes.fuseaction")>
		<cfif isdefined("attributes.user_profile_id")>AND user_profile_id=#attributes.user_profile_id#</cfif>
		<cfif comparenocase(listlast(attributes.fuseaction, '.'),"load_profile") AND isdefined("attributes.profile_name")>AND profile_name='#attributes.profile_name#'<cfelse>
ORDER BY profile_name</cfif>
	<cfelse>
	AND primary_profile_ind=1
	</cfif>
</cfquery>
</cfsilent>

