
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
	||
 --->
<cfquery name="delete_module_access" datasource="#application.datasources.main#">
DELETE
FROM Security_Module_Access
WHERE emp_id=#attributes.emp_id# and module_id in (#attributes.module_list#)

</cfquery>
</cfsilent>

