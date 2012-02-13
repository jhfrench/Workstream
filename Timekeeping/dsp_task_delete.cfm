
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
			<cfset tabindex=incrementvalue(tabindex)><a href="javascript:delete_check('#attributes.task_id#');" onmouseover="MM_displayStatusMsg('Delete this task from workstream.');return document.MM_returnValue;" tabindex="#tabindex#" class="Note"><img src="#request.dir_level##application.application_specific_settings.image_dir#task_delete.gif" valign="bottom" width="20" height="20" alt="Delete this task." border="0"> Delete this task</a>
		</td>
	</tr>
</cfoutput>

