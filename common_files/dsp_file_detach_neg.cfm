
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
Revision 1.0  2005/02/15 20:41:23  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:53-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
	<tr>
		<td align="center" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			There are no documents associated with this task.
		</td>
	</tr>

