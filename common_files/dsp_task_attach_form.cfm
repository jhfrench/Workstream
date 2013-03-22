
<!--common_files/dsp_task_attach_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the form that allows the user to select which tasks to link with the base task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	<-- base_task_id: number that uniquely defines the base task
	<-- linked_task_id: list of tasks to be attached to a particular task
 --->
</cfsilent>
<SCRIPT LANGUAGE="JavaScript1.1">
function add_to_linked_task_id_list() {
	with (document.attach_task.task_id) {
		if (options[selectedIndex] == null)
			return false;
		else {
			if (document.attach_task.linked_task_id.value!='') {
				document.attach_task.linked_task_id.value=document.attach_task.linked_task_id.value+','+options[selectedIndex].value;
			}
			else {
				document.attach_task.linked_task_id.value=options[selectedIndex].value;
			}
			return true;
		}
	}
}
</SCRIPT>
<cfmodule template="qry_get_open_tasks.cfm" exclude_task_id="#attributes.base_task_id#">
<cfoutput>
<cfform name="attach_task" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>Link Tasks</h2></legend>
		<div class="control-group">
			<label class="control-label" for="project_id">Project</label>
			<div class="controls">
			<cfmodule template="../common_files/two_related_selects.cfm"
				query="get_open_tasks"
				name1="project_id"
				name2="task_id"
				display1="project_display"
				display2="task_display"
				value1="project_id"
				value2="task_id"
				multiple1="0"
				multiple2="0"
				size1="6"
				size2="6"
				class1="span6"
				class2="span6"
				autoselectfirst="no"
				formname="attach_task"
				HTMLBetween="</div><div class='control-group'><label class='control-label' for='task_id'>Task</label><div class='controls'>">
				<br /><input type="button" value="Add to list below" onclick="add_to_linked_task_id_list()" class="btn btn-success" >
				<p class="help-block">Specify one or more tasks to link to this task.</p>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="linked_task_id" id="linked_task_id">Tasks to link</label>
			<div class="controls">
				<input type="text" name="linked_task_id" size="30" class="span8" />
				<p class="help-block">You may also just type task IDs into this field (separate list items with commas).</p>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="base_task_id" value="#attributes.base_task_id#" />
			<input type="submit" name="submit" value="Submit" class="btn btn-primary" />
			<input type="reset" name="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</cfform>
</cfoutput>