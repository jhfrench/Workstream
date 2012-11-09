
<!--Directory/qry_emp_biography_entry.cfm
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
<cfif len(attributes.biography)>
<cfquery name="emp_biography_entry" datasource="#application.datasources.main#">
INSERT INTO Emp_Biography(user_account_id,biography)
VALUES(#variables.user_account_id#,'#stripcr(paragraphformat(attributes.biography))#')
</cfquery><!--- 
<cfquery name="emp_biography_delete" datasource="#application.datasources.main#">
DELETE FROM Emp_Biography
WHERE user_account_id=#variables.user_account_id#
</cfquery> --->
</cfif>
</cfsilent>

