
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
	||
 --->
<cfquery name="delete_object_access" datasource="#application.datasources.main#">
DELETE
FROM Security_Object_Access
WHERE emp_id=#attributes.emp_id#  and object_id in (#attributes.obj_list#)
</cfquery>
</cfsilent>

