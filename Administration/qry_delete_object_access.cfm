
<!--Admin/qry_delete_object_access.cfm
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
Revision 1.1  2006/09/15 22:26:11  csy
<>

Revision 1.0  2006-08-16 09:32:10-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:37-05  daugherty
Initial revision

Revision 1.2  2002-03-08 16:59:13-05  long
changed query so that access is removed only from objects that we want them to lose.

Revision 1.1  2001-10-11 10:55:31-04  long
Added $log $ for edits to all CFM files that have fusedocs.
	||
 --->
<cfquery name="delete_object_access" datasource="#application.datasources.main#">
DELETE
FROM Security_Object_Access
WHERE emp_id=#attributes.emp_id#  and object_id in (#attributes.obj_list#)
</cfquery>
</cfsilent>

