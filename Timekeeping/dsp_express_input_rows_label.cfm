
<!--Timekeeping/dsp_express_input_rows_label.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the column labels for the express entry rows.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
	<tr bgcolor="#0000FF" class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>White">
		<td align="center" colspan="4">
			<em>-Express=</em> Time Entry
		</td>
	</tr>
	<cfoutput><tr align="center" bgcolor="##C0C0C0" class="SubHeadText#session.workstream_text_size#">
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Date
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Hours
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			<cfif compare(fuseaction, "time_entry")>	
				Task
			<cfelse>
				Code
			</cfif>
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Notes
		</td>
	</tr></cfoutput>
