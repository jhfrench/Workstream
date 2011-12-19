
<!--Timekeeping/act_reassign_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I reassign hours.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:20:13  stetzer
<>

Revision 1.1  2001-10-11 10:55:17-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> attributes.reassign_hours: list, delimited by |, that contains the emp_id of an employee and the task_id of a task
 --->
<cfloop list="#attributes.reassign_hours#" index="ii">
	<cfinclude template="qry_reassign_hours.cfm">
</cfloop>
</cfsilent>