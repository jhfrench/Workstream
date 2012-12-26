
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
	--> project_name: string that contains the name of the project the task is assigned to
 --->
</cfsilent>
<h5>Associated Files</h5>
<cfif comparenocase(listlast(attributes.fuseaction, '.'),"new_task") AND get_associated_files.recordcount>
	<div>
	<cfoutput query="get_associated_files">
		<cfset variables.file_img="na">
		<cfif listfindnocase(application.application_specific_settings.valid_files,left(listlast(file_path,"."),3))>
			<cfset variables.file_img=left(listlast(file_path,"."),3)>
		</cfif>
		<a href="<cfif comparenocase(left(file_path,4),'http')>file:///</cfif>#file_path#" target="_blank"><i class="icon_file_#variables.file_img#"></i> #file_path#</a><cfif currentrow NEQ get_associated_files.recordcount><br /></cfif>
	</cfoutput>
	</div>
<cfelse>
	<p class="text-warning">No files currently associated with this task.</p>
</cfif>
<cfoutput>
<input type="hidden" name="file_path" value="0">
<div class="btn-group">
	<a id="file_attach" data-toggle="modal" href="index.cfm?task_id=#attributes.task_id#&fuseaction=common_files.file_attach" data-target="##utility" title="Associate a file path to this task." class="btn"><i class="icon-folder-open"></i> Attach</a>
	<a id="file_detach" data-toggle="modal" href="index.cfm?task_id=#attributes.task_id#&fuseaction=common_files.file_detach" data-target="##utility" title="Remove a file path from this task." class="btn"><i class="icon-remove-sign"></i> Remove</a>
</div>
</cfoutput>