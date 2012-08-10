
<!--Customers/dsp_edit_engagement_menu.cfm
	Author: Jeromy French  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the list of details that a user can edit on an engagement.
	||
	Name: Jeromy F
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_engagement" fuseaction="Customers.edit_engagement" field_name="option" field_value="1" field2_name="project_id" field2_value="#attributes.project_id#">
<cfoutput>
<h2>Edit Project for <a href="javascript:engagement_list('#get_customer_name_code.root_code#');">#get_customer_name_code.project_name#- #get_customer_name_code.project_code#</a></h2>
<dl>
	<dt><a href="javascript:edit_engagement(1);">Main engagement details</a></dt>
	<dd>Project code, name, status, visible-to, mission, vision, business case</dd>
	<dt><a href="javascript:edit_engagement(2);">Billing information</a></dt>
	<dd>Work start and end, billing type, budget, etc</dd>
	<dt><a href="javascript:edit_engagement(3);">Custom fields</a></dt>
	<dd>Add, delete, edit</dd>
</dl>
</cfoutput>
