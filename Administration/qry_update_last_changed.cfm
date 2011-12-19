
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
	Revision 1.2  2006/09/15 22:25:08  csy
	<>

	Revision 1.0  2006-08-16 09:32:14-04  csy
	Initial revision

	Revision 1.1  2006-07-05 13:26:04-04  french
	Modified code so that not all updates will attempt to change the password, etc.

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

