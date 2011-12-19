
<!--Reports/dsp_hours_code_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:07:02  stetzer
<>

Revision 1.1  2001-10-11 11:04:40-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<tr bgcolor="##0000ff" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">
		<td width="25">&nbsp;&nbsp;</td>
		<td><cfoutput> #clientName# - #clientCode#</cfoutput></td>
		<td width="25">&nbsp;&nbsp;</td>
		<td>Hours: </td>
	<td width="25">&nbsp;&nbsp;</td>
	</tr>


