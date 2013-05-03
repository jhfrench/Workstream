
<!--common_files/pag_task_detach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I allow the user to delete a task association.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfif isdefined("attributes.l_t_t_id")>
	<cfinclude template="act_task_detach.cfm">
</cfif>
<cfinclude template="qry_get_associated_tasks.cfm">
<cfif get_associated_tasks.recordcount>
	<cfinclude template="dsp_task_detach_form.cfm">
<cfelse>
	<div class="alert alert-info">
		There are no other tasks associated with this task.
	</div>
</cfif>
