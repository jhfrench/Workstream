
<!--Customers/dsp_edit_project_menu.cfm
	Author: Jeromy French -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the list of details that a user can edit on an project.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_project" fuseaction="Customers.edit_project" field_name="option" field_value="1" field2_name="project_id" field2_value="#attributes.project_id#">
<cfoutput>
<h2>Edit Project for <a href="javascript:project_list('#get_customer_name_code.root_code#');" title="View other projects for this customer.">#get_customer_name_code.project_name#</a>&ndash;#get_customer_name_code.project_code#</h2>
<dl>
	<dt><a href="javascript:edit_project(1);">Main project details</a></dt>
	<dd>Project code, name, health, status, visible-to, mission, vision, business case</dd>
	<dt><a href="javascript:edit_project(2);">Billing information</a></dt>
	<dd>Work start and end, billing type, budget, etc</dd>
	<dt><a href="javascript:edit_project(3);">Custom fields</a></dt>
	<dd>Add, delete, edit</dd>
</dl>
</cfoutput>
