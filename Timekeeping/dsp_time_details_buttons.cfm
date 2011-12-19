
<!--Timekeeping/dsp_time_details_buttons.cfm
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
		<td align="center" colspan="3">
			<input type="Reset" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"> | <input type="submit" value="Reassign" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
	</tr>