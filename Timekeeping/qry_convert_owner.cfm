
<!--Timekeeping/qry_convert_owner.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:23:14  stetzer
<>

Revision 1.1  2001-10-11 10:54:53-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
	--> get_task_details.owner_id: number that uniquely identifies the owner of a task
 --->
<cfquery name="convert_owner" datasource="#application.datasources.main#">
SELECT name, lname
FROM Emp_Contact
WHERE emp_id = #get_task_details.owner_id#
</cfquery>
</cfsilent>

