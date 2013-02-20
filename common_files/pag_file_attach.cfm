
<!--common_files/pag_file_attach.cfm
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
<cfif isdefined("form.my_file")>
	<cfinclude template="act_file_attach.cfm">
</cfif>

<script language="JavaScript" type="text/javascript">
function upload_file_type_check() {
	if (document.forms.file_attach.MY_FILE.value=='') {
		alert('Please select a file to upload.');
		return false;
	}
	else {
		$('#file_attach_table').toggle();
		$('#upload_in_progress').toggle();
		$('.form-actions').toggle();
	}
}
</script>

<cfinclude template="qry_get_project_attachment_path.cfm">
<div id="pop-up-content">
	<cfform name="file_attach" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post" enctype="multipart/form-data" onsubmit="return upload_file_type_check();" class="form-horizontal">
		<fieldset id="file_attach_table">
			<legend><h2>Attach <cfif isdefined("form.my_file")>another<cfelse>your</cfif> document</h2></legend>
			<div class="control-group">
				<label class="control-label" for="file_path">Path to file</label>
				<div class="controls">
					<cfselect name="file_path" id="file_path" query="get_project_attachment_path" value="file_path" display="file_path" required="yes" message="Please specify the file path." class="span8" />
				</div>
			</div>
			<div class="control-group">
				<label class="control-label" for="my_file">File to upload</label>
				<div class="controls">
					<input type="file" name="MY_FILE" id="my_file" required="required" class="span8" />
				</div>
			</div>
			<div class="form-actions">
			<cfoutput>
				<input type="hidden" name="task_id" value="#attributes.task_id#" />
				<input type="submit" name="upload_file" value="Upload File" class="btn btn-primary" />
				<input type="reset" name="reset" value="Cancel" class="btn" />
			</cfoutput> 
			</div>
		</fieldset>
	</cfform>
	<div class="alert alert-info" id="upload_in_progress" aria-hidden="true" style="display:none">
		<h2>Loading your file</h2>
		<img src="images/loading.gif" alt="" width="48" height="48" style="padding:30px;" align="center" />
	</div>
</div>