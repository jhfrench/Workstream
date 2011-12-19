
<!--common_files/dsp_file_attach_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities:
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
	<tr>
		<td colspan="2" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			File attachment tool
		</td>
	</tr>