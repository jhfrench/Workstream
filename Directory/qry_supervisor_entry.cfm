
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
	Revision 1.0  2005/02/15 20:47:18  daugherty
	Initial revision

	Revision 1.1  2002-03-08 16:41:31-05  long
	changed the file to accomidate multiple supervisors

	Revision 1.0  2001-10-16 17:05:56-04  french
	Initial revision

	||
	Variables:
 --->
<cfloop list="#attributes.supervisor_id#" index="ii">
<cfquery name="supervisor_entry" datasource="#application.datasources.main#">
INSERT INTO Supervisor(emp_id,sup_id)
VALUES(#variables.emp_id#,#ii#)
</cfquery>
</cfloop>	
<!--- 
<cfquery name="supervisor_delete" datasource="#application.datasources.main#">
DELETE Supervisor
WHERE emp_id=#variables.emp_id#
</cfquery> --->

