
<!--Timekeeping/dsp_associated_files.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the attributes of a task. If a task is not specified I display the form to set task details/create a new task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> customer_name: string that identifies the customer for whom the task is created
	--> project_name: string that contains the name of the project or engagement the task is assigned to
 --->
</cfsilent>
			Associated files<br />
			<cfif comparenocase(listlast(attributes.fuseaction, '.'),"new_task") AND get_associated_files.recordcount>
			<cfoutput query="get_associated_files">
				<cfset variables.file_img="NA">
				<cfif listfindnocase(variables.valid_files,left(listlast(file_path,"."),3))>
					<cfset variables.file_img=left(listlast(file_path,"."),3)>
				</cfif>
			<a href="#file_path#" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" target="_blank" class="RegText"><img src="#request.dir_level##application.application_specific_settings.image_dir#icon_#variables.file_img#.gif" valign="bottom" width="16" height="16" border="0" /> #file_path#</a><cfif currentrow NEQ get_associated_files.recordcount><br /></cfif></cfoutput>
			<cfelse>
			<span class="Note">No files currently associated with this task.</span>
			</cfif><br />
			<cfoutput>
			<input type="hidden" name="file_path" value="0">
			<img src="#application.application_specific_settings.image_dir#file_attach.gif" valign="bottom" width="60" height="20" alt="Associate a file path to this task." border="0"  onclick="window.open('index.cfm?fuseaction=common_files.file_attach&task_id=#attributes.task_id#', 'files', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=0,copyhistory=0,width=420,height=210');" tabindex="#incrementvalue(tabindex)#">
			<img src="#application.application_specific_settings.image_dir#file_detach.gif" valign="bottom" width="60" height="20" alt="Remove a file path from this task." border="0"  onclick="javascript:window.open('index.cfm?fuseaction=common_files.file_detach&task_id=#attributes.task_id#', 'files', 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=0,resizable=1,copyhistory=0,width=350,height=350');" tabindex="#incrementvalue(tabindex)#">
			</cfoutput>

