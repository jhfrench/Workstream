
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

