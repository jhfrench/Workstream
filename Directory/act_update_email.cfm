
<!-- Directory/act_update_email.cfm
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
<cfquery name="email_delete" datasource="#application.datasources.main#">
DELETE FROM Email
WHERE user_account_id=#attributes.user_account_id#
</cfquery>

<cfloop query="get_email_types">
	<cfif len(evaluate("attributes.email_#email_type_id#"))>
		<cfset email = evaluate("attributes.email_#email_type_id#")>
		<cfquery name="insert_email" datasource="#application.datasources.main#">
		INSERT INTO Email(user_account_id,email,email_type_id)
		VALUES(#attributes.user_account_id#,'#email#',#email_type_id#)
		</cfquery>
	</cfif>
</cfloop>

</cfsilent>
