
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfquery name="profile_lookup" datasource="#application.datasources.main#">
SELECT *
FROM User_Profile
WHERE emp_id=#session.user_account_id#
	<cfif isdefined("attributes.fuseaction")>
		<cfif isdefined("attributes.profile_id")>AND profile_id=#attributes.profile_id#</cfif>
		<cfif compare(listlast(attributes.fuseaction, '.'),"load_profile") AND isdefined("attributes.profile_name")>AND profile_name='#attributes.profile_name#'<cfelse>
ORDER BY profile_name</cfif>
	<cfelse>
	AND primary_profile=1
	</cfif>
</cfquery>
</cfsilent>

