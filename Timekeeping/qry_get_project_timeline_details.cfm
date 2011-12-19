
<!--Timekeeping/qry_get_project_timeline_details.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the rows for the Project Timeline output.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:26:12  stetzer
	<>

	Revision 1.3  2001-11-28 13:50:54-05  french
	Modified code to recognize options that should be ignored as specified by the user during timeline creation.

	Revision 1.2  2001-11-01 16:18:22-05  french
	Changed capitaliztion of Tables to make query easier to read.

	Revision 1.1  2001-10-30 11:13:24-05  french
	Initial query coding.

	Revision 1.0  2001-10-29 16:28:08-05  french
	File creation.

	||
	END FUSEDOC --->
<cfquery name="get_project_timeline_details" datasource="#application.datasources.main#">
SELECT Project_Planning.project_planning_name, User_Fields.field_title,
	User_Field_Items.selection_title, User_Field_Values.Task_ID, Task.task_id,
	(CASE WHEN REF_Icon.path !='0' THEN REF_Icon.path ELSE 'document.gif' END) AS task_icon, 
    Task.name AS task_name, Task.description AS task_description, Task.assigned_date,
	Task.due_date, REF_Status.status
FROM Project_Planning, User_Fields, User_Field_Items, User_Field_Values, Task, REF_Icon, REF_Status
WHERE Project_Planning.user_field_id=User_Fields.user_field_id
	AND User_Fields.user_field_id=User_Field_Items.user_field_id
	AND User_Field_Items.user_field_items_id=User_Field_Values.User_Field_Items_ID
	AND User_Field_Values.Task_ID=Task.task_id
	AND Task.icon_id=REF_Icon.icon_id
	AND Task.status_id=REF_Status.status_id
	AND Project_Planning.project_planning_id=#attributes.project_planning_id#
	AND User_Field_Items.user_field_items_id!=Project_Planning.hide_user_field_item_id
ORDER BY User_Field_Items.user_field_items_id, Task.assigned_date
</cfquery>
</cfsilent>

