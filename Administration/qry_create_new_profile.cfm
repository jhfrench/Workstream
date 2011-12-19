
<!--Admin/qry_create_new_profile.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a user new profile into the CompanyVisibleInUserProfile table.
	||
	
 --->

<cfquery name="disable_old_profile" datasource="#application.datasources.main#">
UPDATE CompanyVisibleInUserProfile
SET active=0
WHERE active =1
	AND emp_id=#session.user_account_id#
</cfquery>

<!--- Insert new option selections into table  --->
<cfloop index = "company_id" list ="#session.workstream_selected_company_id#">
	<cfquery name="create_new_profile" datasource="#application.datasources.main#">
	INSERT INTO CompanyVisibleInUserProfile (emp_id,company_id,active)
	VALUES (#session.user_account_id#,#company_id#,1)
	</cfquery>
</cfloop>

<!--- Remove previous profile options after new ones are entered --->
<cfquery name="remove_old_profile" datasource="#application.datasources.main#">
DELETE CompanyVisibleInUserProfile
where active = 0
AND emp_id=#session.user_account_id#
</cfquery>
</cfsilent>

