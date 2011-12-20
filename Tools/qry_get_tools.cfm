
<!--Tools/qry_get_tools.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I select all the information on the tools that the user has available to them.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfquery name="get_tools" datasource="#application.datasources.main#">
    SELECT report_name, action, custom_URL, custom_ind, description
FROM REF_Objects,Security_Object_Access
WHERE REF_Objects.object_id = Security_Object_Access.object_id 
	AND Security_Object_Access.active_ind = 1 
	AND REF_Objects.active_ind = 1 
	AND emp_id = #session.user_account_id# and module_id = 9
</cfquery>
</cfsilent>