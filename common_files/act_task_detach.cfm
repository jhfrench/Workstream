
<!--common_files/act_task_detach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I delete the table entries that tie a task to another task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfquery name="task_detach" datasource="#application.datasources.main#">
    DELETE 
	FROM Task_Link
    WHERE task_link_id IN (#attributes.del_task#)
</cfquery>
</cfsilent>
	
