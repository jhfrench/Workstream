
<!--common_files/act_task_attach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I perform the actions to associate one or more (linked) tasks with another (base) task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	--> attributes.base_task_id: number that uniquely defines the base task
	--> attributes.linked_task_id: list of tasks to be attached to a particular task
 --->
</cfsilent>
<cfoutput>
<cfif attributes.base_task_id EQ 0 OR attributes.linked_task_id EQ 0>
	<div class="alert alert-error">
		<strong>Nein!</strong>
		I can't link to task "0"!
	</div>
<cfelseif attributes.base_task_id EQ attributes.linked_task_id>
	<div class="alert alert-error">
		<strong>Nein!</strong>
		Now why would I want to link a task to itself?
	</div>
<cfelse>
	<cfinclude template="qry_insert_link_task_task.cfm">
	<div class="alert alert-success">
		<strong>That worked!</strong>
		You have associated tasks with <a href="javascript:task_details(#attributes.base_task_id#);">task #attributes.base_task_id#</a>.
	</div>
	<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="task_details" field_name="task_id" fuseaction="Timekeeping.task_details">
</cfif>
</cfoutput>