
<!--Timekeeping/dsp_time_details_header.cfm
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
			Employee
		</td>
		<td align="right">
			Hours
		</td>
		<td align="center">
			Reassign Hours
		</td>
	</tr>
