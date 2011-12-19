
<!--Timekeeping/dsp_task_description_header.cfm
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
	<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="2">
			&nbsp;&nbsp;
		</td>
		<td colspan="3" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			Task details&nbsp;
		</td>
	</tr>

