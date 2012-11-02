
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
<cfif attributes.base_task_id NEQ 0>
	<cfinclude template="qry_task_attach.cfm">
<cfelse>
	<script language="JavaScript" type="text/javascript">
	opener.document.new_task_form.linked_task_id.value='#attributes.linked_task_id#';
	</script>
</cfif>
<div class="alert alert-success">
<strong>That worked!</strong>
You have associated tasks with task #attributes.base_task_id#.
</div>
</cfoutput>
