
<!--Customers/act_edit_project_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows the edit of a currently existing project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_customer_name_code.cfm">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="project_list" field_name="client_code" field_value="1" fuseaction="Customers.projects">
