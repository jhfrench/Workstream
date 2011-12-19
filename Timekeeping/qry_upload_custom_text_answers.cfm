
<!--Timekeeping/qry_upload_custom_text_answers.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I update the the list of files associated with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:28:25  stetzer
	<>

	Revision 1.1  2002-02-06 14:40:11-05  french
	Removed delete statement that was removing answers to archived information.

	Revision 1.0  2001-10-18 16:17:14-04  french
	Created file for custom field support.

	||
	--> application.datasources.main: string that contains the name of the datasource as mapped in CF administrator
 --->
<cfloop list="#attributes.custom_text_collection#" index="ii">
<cfif len(evaluate("attributes.custom_text#ii#"))>
<cfset variables.insert_text=evaluate("attributes.custom_text#ii#")>
<cfquery name="reset_custom_text_answers" datasource="#application.datasources.main#">
INSERT INTO User_Field_Items(selection_title,user_field_id)
VALUES('#variables.insert_text#',#ii#)
</cfquery>
<cfquery name="get_last_entry" datasource="#application.datasources.main#">
SELECT MAX(user_field_items_id) AS last_entry 
FROM User_Field_Items
WHERE user_field_id=#ii#
</cfquery>
<cfquery name="upload_custom_text_answers" datasource="#application.datasources.main#">
INSERT INTO User_Field_Values(task_id,user_field_id,user_field_items_id)
VALUES (#attributes.task_id#,#ii#,#get_last_entry.last_entry#)
</cfquery>
</cfif>
</cfloop>
</cfsilent>

