
<!--Timekeeping/qry_get_project_timeline_details.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I retrieve the rows for the Project Timeline output.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfquery name="get_project_timeline_details" datasource="#application.datasources.main#">
SELECT Project_Planning.project_planning_name, User_Fields.field_title,
	User_Field_Items.selection_title, User_Field_Values.Task_ID, Task.task_id,
	(CASE WHEN REF_Icon.path!='0' THEN REF_Icon.path ELSE 'document.gif' END) AS task_icon, 
    Task.name AS task_name, Task.description AS task_description, Task.assigned_date,
	Task.due_date, REF_Task_Status.description AS status
FROM Project_Planning
	INNER JOIN User_Fields ON Project_Planning.user_field_id=User_Fields.user_field_id
	INNER JOIN User_Field_Items ON User_Fields.user_field_id=User_Field_Items.user_field_id
		AND Project_Planning.hide_user_field_item_id!=User_Field_Items.user_field_items_id
	INNER JOIN User_Field_Values ON User_Field_Items.user_field_items_id=User_Field_Values.user_field_items_id
	INNER JOIN Task ON User_Field_Values.task_id=Task.task_id
	INNER JOIN REF_Icon ON Task.icon_id=REF_Icon.icon_id
	INNER JOIN Link_Task_Task_Status ON Task.task_id=Link_Task_Task_Status.task_id
		AND Link_Task_Task_Status.active_ind=1
	INNER JOIN REF_Task_Status ON Link_Task_Task_Status.task_status_id=REF_Task_Status.task_status_id
WHERE Project_Planning.project_planning_id=#attributes.project_planning_id#
ORDER BY User_Field_Items.user_field_items_id, Task.assigned_date
</cfquery>
</cfsilent>
