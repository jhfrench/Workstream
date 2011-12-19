
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
INSERT INTO Supervisor(emp_id, sup_id)
VALUES(#variables.emp_id#, #ii#)
</cfquery>
</cfloop>

