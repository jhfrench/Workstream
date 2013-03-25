
<!--Admin/qry_delete_profile.cfm
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
	 ||
 --->
<cfquery name="delete_profile" datasource="#application.datasources.main#">
UPDATE User_Profile
SET active_ind=0
WHERE active_ind=1
	AND user_account_id=<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />
	AND profile_name='#attributes.profile_name#'
</cfquery>
</cfsilent>
