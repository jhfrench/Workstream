
<!-- Directory/act_update_phone.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	Variables:

	END FUSEDOC --->
<cfquery name="phone_delete" datasource="#application.datasources.main#">
DELETE FROM Phone
WHERE user_account_id=#attributes.user_account_id#
</cfquery>
<cfloop query="get_phone_types">
	<cfif len(evaluate("attributes.phone_#phone_type_id#")) OR len(evaluate("attributes.phone_#phone_type_id#_ext"))>
		<cfset phone = "#evaluate("attributes.phone_#phone_type_id#")#">
		<cfset ext = "#evaluate("attributes.phone_#phone_type_id#_ext")#">
		<cfquery name="insert_phone" datasource="#application.datasources.main#">
			INSERT INTO Phone(user_account_id,phone_number<cfif len(evaluate("attributes.phone_#phone_type_id#_ext"))>,extension</cfif>,phone_type_id)
			VALUES(#attributes.user_account_id#,'#phone#'<cfif len(evaluate("attributes.phone_#phone_type_id#_ext"))>,'#ext#'</cfif>,#phone_type_id#)
		</cfquery>
	</cfif>
</cfloop>
</cfsilent>
