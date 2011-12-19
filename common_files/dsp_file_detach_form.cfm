
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> file_id: number that uniquely identifies a file mapping
	--> file_path: string that contains directions to open the specified file
 --->
<form action="" method="post">
<cfoutput>
	<tr>
		<td colspan="2" class="SelectText#session.workstream_text_size#">
			Mark the files you wish to unbind from the task, or click on the file path to open the specified file.
		</td>
	</tr>
	<tr>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Delete File
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			File Path
		</td>
	</tr>
</cfoutput>
	<cfoutput query="get_associated_files">
	<tr>
		<td align="center">
			<input type="Checkbox" name="del_file" value="#file_id#" class="RegText#session.workstream_text_size#">	
		</td>
		<td>
			<a href="#file_path#" target="_blank" class="SelectText#session.workstream_text_size#">#file_path#</a>
		</td>	
	</tr>
	</cfoutput>
<cfoutput>
	<tr>
		<td align="center" colspan="2">
 			<input type="submit" value="Delete" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>
</form>

