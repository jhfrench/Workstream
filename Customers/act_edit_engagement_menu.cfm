
<!--Customers/act_edit_engagement_menu.cfm
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
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_engagement" field_name="option" field_value="1" field2_name="project_id" field2_value="#attributes.project_id#" fuseaction="Customers.edit_engagement">

