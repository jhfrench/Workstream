
<!--Timekeeping/dsp_no_entries.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr>
		<td colspan="2" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			&nbsp;&nbsp;
		</td>
		<td class="Note<cfoutput>#session.workstream_text_size#</cfoutput>">
			No time entered for this task yet.
		</td>
		<td colspan="2" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			&nbsp;&nbsp;
		</td>
	</tr>