
<!--Admin/qry_delete_module_access.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2006/09/15 22:26:18  csy
<>

Revision 1.0  2006-08-16 09:32:09-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:36-05  daugherty
Initial revision

Revision 1.2  2002-03-08 16:57:00-05  long
changed the query so that only reports that we want to be deleted are actually deleted.

Revision 1.1  2001-10-11 10:55:32-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
 --->
<cfquery name="delete_module_access" datasource="#application.datasources.main#">
DELETE
FROM Security_Module_Access
WHERE emp_id=#attributes.emp_id# and module_id in (#attributes.module_list#)

</cfquery>
</cfsilent>

