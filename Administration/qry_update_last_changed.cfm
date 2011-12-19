
<!--Admin/qry_update_last_changed.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the last time an account was modified.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfparam name="attributes.update_security_details" default="1">
<cfif isdefined("attributes.disable")>
	<cfset disable=1>
<cfelse>
	<cfset disable=0>
</cfif>
<cfquery name="update_last_changed" datasource="#application.datasources.main#">
UPDATE Security
SET last_updated=#createodbcdatetime(now())#<cfif attributes.update_security_details EQ 1>
<cfif compare(attributes.username,attributes.old_username)>, 
	username='#attributes.username#'</cfif>
<cfif compare(attributes.password,attributes.old_password)>, 
	password='#attributes.password#'</cfif>,
	disable=#disable#</cfif>
WHERE emp_id=#attributes.emp_id#
</cfquery>
</cfsilent>

