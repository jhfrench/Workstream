
<!--common_files/dsp_file_detach_head.cfm
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
 --->
	<tr>
		<td class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			Unbind Files
		</td>
	</tr>

