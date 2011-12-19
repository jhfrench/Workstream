

<!--Reports/dsp_admin_pto_row_head.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column headers for the PTO report.

	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:04:43  stetzer
	<>

	Revision 1.3  2001-10-16 12:14:31-04  french
	Minor formatting changes for display or readability.

	Revision 1.2  2001-10-16 08:42:09-04  long
	made the report compliant with the other PTO hours report.
	
	Revision 1.1  2001-10-11 11:04:51-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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

