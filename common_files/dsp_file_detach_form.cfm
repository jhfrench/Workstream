
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
			<input type="checkbox" name="l_t_f_id" value="#l_t_f_id#" id="l_t_f_id_#l_t_f_id#">	
		</td>
		<td>
			<label for="l_t_f_id_#l_t_f_id#"><a href="#file_path#" target="_blank" class="SelectText">#file_path#</a></label>
		</td>	
	</tr>
	</cfloop>
	<tr>
		<td align="center" colspan="2">
 			<input type="submit" value="Delete">
		</td>
	</tr>
</cfoutput>
</form>

