
<!--Tools/qry_get_all_option_status.cfm
	Author: Damon S  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I find out if the current user has the "all_option" set for the expense object.
	||
	Name: Damon Scott
	||
	Edits:
	||
	END FUSEDOC --->
<cfquery name="get_all_option_status" datasource="#application.datasources.main#" >
SELECT *
FROM Security_Object_Access
WHERE object_id = 24
	AND emp_id = #session.user_account_id#
</cfquery>
</cfsilent>
