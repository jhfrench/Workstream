
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
	<-- bgcolor: string that sets the backgroud color of this pop-up window
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
		Element.toggle('file_attach_table');
		Element.toggle('upload_in_progress');
		return true;
	}
}
</script>

<cfquery name="get_project_attachment_path" datasource="#application.datasources.main#">
SELECT Link_Project_Attachment_Path.file_path
FROM Link_Project_Attachment_Path
	INNER JOIN Task ON Link_Project_Attachment_Path.project_id=Task.project_id
		AND Task.task_id=#attributes.task_id#
WHERE Link_Project_Attachment_Path.active_ind=1
ORDER BY Link_Project_Attachment_Path.file_path
</cfquery>

<cfform name="file_attach" action="index.cfm?fuseaction=#attributes.fuseaction#" method="Post" enctype="multipart/form-data" onsubmit="return upload_file_type_check();">
<table border="0" cellspacing="0" cellpadding="0" summary="Table displays file upload form criteria until submitted." width="100%">
	<tr>
		<td id="file_attach_table">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="#cccccc" summary="Table displays file upload form criteria">
	<tr bgcolor="999999"><th>Upload your document</th></tr>
	<tr bgcolor="#eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays files to upload">
			<tr>
				<td align="left"><label for="filebox">File to Upload</label>:</td>
				<td align="left"><cfselect name="file_path" query="get_project_attachment_path" value="file_path" description="file_path" required="yes" message="Please specify the file path." /><input type="file" id="filebox" name="MY_FILE" alt="Please specify the filepath to the file you wish to upload." /></td>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="#dddddd">
		<td align="center">
		<cfoutput>
			<input type="hidden" name="task_id" value="#attributes.task_id#" />
			<input type="submit" name="upload_file" value="Upload File" class="btn btn-primary" />
			<input type="reset" value="Cancel" class="btn" />
		</cfoutput> 
		</td>
	</tr>
</table>
		</td>
	</tr>
	<tr id="upload_in_progress" style="display:none">
		<td align="center">
			<h2>Loading your file</h2>
			<img src="images/loading.gif" alt="Animated gif that shows a gear and reads Loading your file" width="48" height="48" style="padding:30px;" align="center" />
		</td>
	</tr>
</table>
</cfform>



