
<!--Directory/qry_get_subordinates.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees based on the needs of the user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	(JF | 11/6/2012)
	Converted query into function call.
	||
	Variables:
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested
	END FUSEDOC --->
</cfsilent>

<cfquery name="get_subordinates" datasource="#application.datasources.main#">
SELECT *
FROM Organization_Hierarchy(<cfqueryparam value="#attributes.user_account_id#" cfsqltype="cf_sql_integer" />)
</cfquery>
