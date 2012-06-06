
<!--Timekeeping/dsp_task_delete.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the link that lets a user delete a task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
</cfsilent>
<cfoutput>
	<tr>
		<td width="15">
		 <!--- GUTTER COLUMN --->
		</td>
			<!--- MISC TASK FUNCTIONS --->
		<td colspan="2" class="Note">
			<a href="javascript:delete_check('#attributes.task_id#');"  title="Delete this task from workstream." class="Note"><img src="#request.dir_level##application.application_specific_settings.image_dir#task_delete.gif" valign="bottom" width="20" height="20" alt="Delete this task." border="0"> Delete this task</a>
		</td>
	</tr>
</cfoutput>

