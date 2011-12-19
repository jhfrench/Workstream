
<!--Reports/dsp_sick_bank_output.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the Sick Bank report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:09:18  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<table border="0" cellpadding="1" cellspacing="0" align="center" width="50%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="5" gutter="0" section_color="008080" section_title="&nbsp;Sick Bank Report" title_class="HeadText#session.workstream_text_size#White">
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td class="SubHeadText#session.workstream_text_size#White">Employee</td>
		<td class="SubHeadText#session.workstream_text_size#White">Hours Granted</td>
		<td class="SubHeadText#session.workstream_text_size#White">Hours Used</td>
		<td class="SubHeadText#session.workstream_text_size#White">Hours Remaining</td>
	</tr>
</cfoutput>
<cfoutput query="get_sick_bank">
	<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif>>
		<td class="RegText#session.workstream_text_size#">#lname#, #name#</td>
		<td align="right" class="RegText#session.workstream_text_size#">#decimalformat(granted_hours)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">#decimalformat(hours_used)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">#decimalformat(hours_remaining)#</td>
	</tr>
</cfoutput>
</table>
