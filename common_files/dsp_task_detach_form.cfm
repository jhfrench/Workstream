
<!--common_files/dsp_task_detach_form.cfm
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
	--> due_date: date that the task is due
	--> status: string indicating the progress of the task
	--> task_id: number that uniquely identifies a task
	--> task_name: string that gives the name of the task
 --->
</cfsilent>
<cfoutput>
<form name="task_detach" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>Remove Tasks</h2></legend>
		<div class="control-group">
			<label>Tasks associated with task #attributes.base_task_id#</label>
			<div class="controls">
				<cfloop query="get_associated_tasks">
					<label class="checkbox" for="l_t_t_id_#l_t_t_id#">
						<input type="checkbox" name="l_t_t_id" id="l_t_t_id_#l_t_t_id#" value="#l_t_t_id#">
						<i class="#task_icon#" title="<cfif sort_order EQ 1>#name# is a sub task to the task you are viewing (task #attributes.base_task_id#).<cfelse>The task you are viewing (task #attributes.base_task_id#) is a sub task to #name#</cfif>"></i>&nbsp;#name#
					</label>
				</cfloop>
				<p class="help-block">Mark the tasks you wish to unbind from task #attributes.base_task_id#.</p>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="base_task_id" value="#attributes.base_task_id#" />
			<input type="submit" name="delete" value="Remove" class="btn btn-primary" />
			<input type="reset" name="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</form>
</cfoutput>