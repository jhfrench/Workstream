
<!--common_files/pag_task_attach.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I allow the user to associate a file path with a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfif isdefined("attributes.linked_task_id")>
	<cfinclude template="act_task_attach.cfm">
</cfif>
<cfinclude template="dsp_task_attach_form.cfm">
