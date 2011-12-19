
<!--Admin/act_change_pass.cfm
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
<cftransaction isolation="READ_COMMITTED">
<cfquery name="set_password" datasource="#application.datasources.main#">
UPDATE Security
SET last_updated=#createodbcdatetime(now())#, password='#attributes.new_pass#'
WHERE emp_id=#session.user_account_id#
</cfquery>
</cftransaction>

