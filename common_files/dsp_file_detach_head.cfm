
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
Revision 1.0  2005/02/15 20:41:22  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:54-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
	<tr>
		<td class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			Unbind Files
		</td>
	</tr>

