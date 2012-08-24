
<!--common_files/dsp_file_detach_form.cfm
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
	--> file_id: number that uniquely identifies a file mapping
	--> file_path: string that contains directions to open the specified file
 --->
</cfsilent>
<cfoutput>
<form name="file_detach" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" class="form-horizontal">
	<fieldset>
		<legend><h2>Remove Files</h2></legend>
		<div class="control-group">
			<label>Files associated with task #attributes.task_id#</label>
			<div class="controls">
				<cfloop query="get_associated_files">
					<label for="l_t_f_id_#l_t_f_id#" class="checkbox">
						<input type="checkbox" name="l_t_f_id" id="l_t_f_id_#l_t_f_id#" value="#l_t_f_id#" />
						<a href="#file_path#" target="_blank">#file_path#</a>
					</label>
				</cfloop>
				<p class="help-block">Mark the files you wish to unbind from task #attributes.task_id#, or click on the file path to open the specified file.</p>
			</div>
		</div>
		<div class="form-actions">
			<input type="hidden" name="task_id" value="#attributes.task_id#" />
			<input type="submit" name="delete" value="Delete" class="btn btn-primary" />
			<input type="reset" name="reset" value="Reset" class="btn" />
		</div>
	</fieldset>
</form>
</cfoutput> 