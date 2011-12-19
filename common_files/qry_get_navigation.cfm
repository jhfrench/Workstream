
<!--common_files/qry_get_navigation.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the objects a user has access to for a particular module.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfquery name="get_navigation" cachedafter="02/02/1978" datasource="#application.datasources.main#">
SELECT REF_Objects.report_name, REF_Objects.custom_ind, REF_Objects.hyperlink,
	REF_Objects.action, Security_Object_Access.custom_url, REF_Objects.display_to_nav
FROM REF_Module, Security_Module_Access, REF_Objects, Security_Object_Access 
WHERE REF_Module.module_id=Security_Module_Access.module_id
	AND REF_Module.module_id=REF_Objects.module_id
	AND REF_Objects.object_id=Security_Object_Access.object_id
	AND Security_Module_Access.module_id=#attributes.module_id#
	AND Security_Module_Access.active_ind=1 
	AND REF_Module.active_ind=1
	AND REF_Objects.active_ind=1
	AND Security_Object_Access.active_ind=1
	AND Security_Object_Access.emp_id=#session.user_account_id#
	AND Security_Module_Access.emp_id=#session.user_account_id#
	AND #application.last_updated#=#application.last_updated#
</cfquery>
<cfset session.workstream_object_access=valuelist(get_navigation.report_name)>
</cfsilent>

