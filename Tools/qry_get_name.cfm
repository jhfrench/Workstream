
<!--Tools/qry_get_name.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I get the name of the person whose expense report is being displayed.
	||
	Name: Jeromy French
	||
	Edits:
	 || 
	END FUSEDOC --->
<cfquery name="get_name" datasource="#application.datasources.main#">
SELECT first_name, last_name
FROM Demographics
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id#
</cfquery>
</cfsilent>