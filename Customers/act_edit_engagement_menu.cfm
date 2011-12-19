
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
Revision 1.0  2005/02/15 20:45:29  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:41-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_engagement" field_name="option" field_value="1" field2_name="project_id" field2_value="#attributes.project_id#" fuseaction="edit_engagement">

