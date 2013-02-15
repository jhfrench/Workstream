
<!--Timekeeping/pag_delete_task.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I run the query that deletes a task from workstream.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
</cfsilent>
<cfif isdefined("attributes.task_id")>
	<cfinclude template="act_delete_task.cfm">
<cfelse>
	<div class="alert alert-error">
		You did not specify a task to delete.
	</div>
</cfif>