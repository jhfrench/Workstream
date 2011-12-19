

<!--Reports/dsp_admin_pto_row_head.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column headers for the PTO report.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td align=center class="SubHeadText#session.workstream_text_size#">Employee ID</td>
		<td align=center class="SubHeadText#session.workstream_text_size#">Name</td>
		<td align=center class="SubHeadText#session.workstream_text_size#">Hours Taken</td>
		<td align=center class="SubHeadText#session.workstream_text_size#">Hours Earned</td>
		<td align=center class="SubHeadText#session.workstream_text_size#">Hours Remaining</td>
	</tr>
</cfoutput>

