
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
	Revision 1.0  2005/02/15 20:41:12  daugherty
	Initial revision

	Revision 1.0  2001-11-13 10:23:52-05  french
	Initial file creation.

	||
 --->
<cfquery name="task_detach" datasource="#application.datasources.main#">
    DELETE 
	FROM Task_Link
    WHERE task_link_id IN (#attributes.del_task#)
</cfquery>
</cfsilent>
	
