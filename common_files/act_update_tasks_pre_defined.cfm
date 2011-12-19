
<!--common_files/act_update_tasks_pre_defined.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I update the Task table to update all the pre-defined tasks.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:41:12  daugherty
	Initial revision

	Revision 1.0  2001-12-07 14:38:58-05  french
	Created the function that updates the tasks_pre_defined_id before running queries.

	||
	END FUSEDOC --->
<cfquery name="get_tasks_pre_defined" datasource="#application.datasources.main#">
SELECT *
FROM Tasks_Pre_Defined
</cfquery>
<cfloop query="get_tasks_pre_defined">
	<cfquery name="set_tasks_pre_defined" datasource="#application.datasources.main#">
	UPDATE Task
	SET tasks_pre_defined_id=#tasks_pre_defined_id#
	WHERE Task.name LIKE '#pre_task_name#%'
		AND tasks_pre_defined_id IS NULL
	</cfquery>
</cfloop>
</cfsilent>

