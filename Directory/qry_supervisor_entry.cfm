
<!--Directory/qry_supervisor_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a demographics record.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
 --->
<cfloop list="#attributes.supervisor_id#" index="ii">
<cfquery name="supervisor_entry" datasource="#application.datasources.main#">
INSERT INTO Supervisor (user_account_id, supervisor_user_account_id, created_by)
VALUES(#variables.user_account_id#, #ii#, #variables.user_identification#)
</cfquery>
</cfloop>

