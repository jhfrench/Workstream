
<!--Directory/qry_security_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a security record after ensuring that the desired username is not already taken by another user.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:47:17  daugherty
	Initial revision

	Revision 1.0  2001-10-16 17:05:56-04  french
	Initial revision

	||
	Variables:
 --->
<cfset variables.lname=attributes.lname>
<cfquery name="username_lookup" datasource="#application.datasources.main#">
SELECT *
FROM Security
WHERE username='#variables.lname#'
</cfquery>
<cfif username_lookup.recordcount NEQ 0>
	<cfset variables.append_num=0>
	<cfloop condition="username_lookup.recordcount NEQ 0">
		<cfset variables.append_num=incrementvalue(variables.append_num)>
		<cfquery name="username_lookup" datasource="#application.datasources.main#">
		SELECT *
		FROM Security
		WHERE username='#variables.lname##variables.append_num#'
		</cfquery>
	</cfloop>
	<cfset variables.lname="#variables.lname##variables.append_num#">
</cfif>
<cfquery name="security_entry" datasource="#application.datasources.main#">
INSERT INTO Security(emp_id,created_by_id,username,password,groups,entered_by,entered_date,disable,last_updated)
VALUES(#variables.emp_id#,#session.user_account_id#,'#variables.lname#','#variables.lname#','workstream',#session.user_account_id#,GETDATE(),0,GETDATE())
</cfquery><!--- 
<cfquery name="security_delete" datasource="#application.datasources.main#">
DELETE Security
WHERE emp_id=#variables.emp_id#
</cfquery> --->

</cfsilent>
