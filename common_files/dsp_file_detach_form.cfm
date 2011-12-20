
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
</cfsilent>
<form action="" method="post">
<cfoutput>
	<tr>
		<td colspan="2" class="SelectText">
			Mark the files you wish to unbind from the task, or click on the file path to open the specified file.
		</td>
	</tr>
	<tr>
		<td align="center" class="SubHeadText">
			Delete File
		</td>
		<td class="SubHeadText">
			File Path
		</td>
	</tr>
	<cfloop query="get_associated_files">
	<tr>
		<td align="center">
			<input type="checkbox" name="associated_file_id" value="#associated_file_id#" id="associated_file_id_#associated_file_id#" class="RegText">	
		</td>
		<td>
			<label for="associated_file_id_#associated_file_id#"><a href="#file_path#" target="_blank" class="SelectText">#file_path#</a></label>
		</td>	
	</tr>
	</cfloop>
	<tr>
		<td align="center" colspan="2">
 			<input type="submit" value="Delete" class="RegText">
		</td>
	</tr>
</cfoutput>
</form>

