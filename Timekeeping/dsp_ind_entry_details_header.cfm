
<!--Timekeeping/dsp_ind_entry_details_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="2">
			&nbsp;
		</td>
		<td>
			Date
		</td>
		<td align="right">
			Hours
		</td>
		<td>
			Notes
		</td>
		<td align="center" width="130">
			Reassign Hours
		</td>
	</tr>

