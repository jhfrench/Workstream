
<!--Timekeeping/act_set_custom_responses.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve all the answer options (pre-defined for drop-down boxes, archived--if any--for text fields) for custom fields.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:20:23  stetzer
	<>

	Revision 1.1  2002-02-04 18:18:27-05  french
	Fixing problem caused by commas in variables.custom_answers_text elements (which alters the list size and element positions). Changed delimiter to ';'.

	Revision 1.0  2001-10-18 16:17:11-04  french
	Created file for custom field support.

	||
 --->
<cfquery name="get_custom_responses" datasource="#application.datasources.main#">
SELECT User_Field_Values.user_field_items_id, User_Field_Items.selection_title
FROM User_Field_Values, User_Field_Items
WHERE User_Field_Values.user_field_items_id=User_Field_Items.user_field_items_id
	AND User_Field_Values.task_id=#attributes.task_id#
</cfquery>
<cfset variables.custom_answers=valuelist(get_custom_responses.user_field_items_id)>
<cfset variables.custom_answers_text=valuelist(get_custom_responses.selection_title,"|")>
</cfsilent>

