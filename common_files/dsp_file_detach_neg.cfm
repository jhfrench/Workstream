
<!--common_files/dsp_file_detach_neg.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a message to the user telling them that they have no files currently associated with the task.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
	<tr>
		<td align="center" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			There are no documents associated with this task.
		</td>
	</tr>

