
<!--common_files/qry_get_profile.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I get new profile for the user.
	||
 --->
 
<cfquery name="get_profile" datasource="#application.datasources.main#">
SELECT *
FROM CompanyVisibleInUserProfile
WHERE emp_id=#session.user_account_id#
	  AND active=1
</cfquery>
</cfsilent>
