
<!--common_files/dsp_big_list_submit.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a submit button with the RegText style sheet applied.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:16  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:58-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
	<tr>
		<td align="center"> 
			<input type="button"  Value="Return" onClick="OKButton()" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>

