
<!--Directory/qry_insert_pto_rollover.cfm
	Author:David L -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I insert a PTO Annual Accrual Hoours into the PTO_rollover table from the employee entry form
	||
	Name: Giwoong David Lee
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfset attributes.Carryover_limit="40">

<cfparam name="attributes.PTO_override" default="">
<cfif len(attributes.PTO_override)>
<cfquery name="insert_pto_rollover" datasource="#application.datasources.main#">
INSERT INTO PTO_Rollover (user_account_id, pto_override, carryover_limit, rollover_year,
	created_by)
VALUES(#variables.user_account_id#, '#attributes.pto_override#', '#attributes.carryover_limit#', EXTRACT(YEAR FROM CURRENT_DATE),
	<cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfquery>
</cfif>

</cfsilent>

