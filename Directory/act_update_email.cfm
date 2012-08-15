
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
WHERE emp_id=#attributes.emp_id#
</cfquery>

<cfloop query="get_email_types">
	<cfif len(evaluate("attributes.email_#email_type_id#"))>
		<cfset email = evaluate("attributes.email_#email_type_id#")>
		<cfquery name="email_entry" datasource="#application.datasources.main#">
		INSERT INTO Email(emp_id,email,email_type_id)
		VALUES(#attributes.emp_id#,'#email#',#email_type_id#)
		</cfquery>
	</cfif>
</cfloop> 

</cfsilent>
