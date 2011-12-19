
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	<-- base_task_id: number that uniquely defines the base task
	<-- linked_task_id: list of tasks to be attached to a particular task
 --->
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
<cfoutput>
<cfform name="attach_task" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
	<cfinclude template="qry_get_open_tasks.cfm">
	<tr>
		<td class="SubHeadText#session.workstream_text_size#">Specify one or more tasks to associate with this task:</td>
	</tr>
	<tr>
		<td>
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
				width2="550"
				autoselectfirst="no"
				formname="attach_task"
				HTMLBetween="<br>">
			<br>
	<tr>
		<td> 
			<input type="button"  Value="Add to list below" onClick="add_to_linked_task_id_list()" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr>
		<td> 
			<input type="text" name="linked_task_id" size="30" class="RegText#session.workstream_text_size#">
			<input type="hidden" name="base_task_id" value="#attributes.base_task_id#">
		</td>
	</tr>
	<tr>
		<td>
			<input type="reset" class="RegText#session.workstream_text_size#">
			<input type="submit" value="Submit" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfform>
</cfoutput>

