
<!--Reports/dsp_hours_code_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<tr bgcolor="##0000ff" class="HeadTextWhite">
		<td width="25">&nbsp;&nbsp;</td>
		<td><cfoutput> #clientName# - #clientCode#</cfoutput></td>
		<td width="25">&nbsp;&nbsp;</td>
		<td>Hours: </td>
	<td width="25">&nbsp;&nbsp;</td>
	</tr>


