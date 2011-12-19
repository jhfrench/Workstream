
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
Revision 1.0  2005/02/15 20:41:21  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:55-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
	<tr>
		<td colspan="2" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			File attachment tool
		</td>
	</tr>