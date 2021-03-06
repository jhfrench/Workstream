
<!--Directory/qry_insert_phone.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert phone records.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
 --->
<cfloop query="get_phone_types">
<cfif len(evaluate("attributes.phone_#phone_type_id#")) OR len(evaluate("attributes.phone_#phone_type_id#_ext"))>
<cfquery name="insert_phone" datasource="#application.datasources.main#">
INSERT INTO Phone(user_account_id, phone_number<cfif len(evaluate("attributes.phone_#phone_type_id#_ext"))>, extension</cfif>,
	phone_type_id, created_by)
VALUES(#variables.user_account_id#, '#evaluate("attributes.phone_#phone_type_id#")#'<cfif len(evaluate("attributes.phone_#phone_type_id#_ext"))>, '#evaluate("attributes.phone_#phone_type_id#_ext")#'</cfif>,
	#phone_type_id#, <cfqueryparam value="#variables.user_identification#" cfsqltype="cf_sql_integer" />)
</cfquery>
</cfif>
</cfloop><!---
<cfquery name="phone_delete" datasource="#application.datasources.main#">
DELETE FROM Phone
WHERE user_account_id=#variables.user_account_id#
</cfquery> --->

</cfsilent>
