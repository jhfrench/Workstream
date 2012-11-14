
<!--Reports/dsp_sick_bank_output.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the Sick Bank report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<table border="0" cellpadding="1" cellspacing="0" align="center" width="50%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="5" gutter="0" section_color="008080" section_title="&nbsp;Sick Bank Report" title_class="HeadTextWhite">
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td class="SubHeadTextWhite">Employee</td>
		<td class="SubHeadTextWhite">Hours Granted</td>
		<td class="SubHeadTextWhite">Hours Used</td>
		<td class="SubHeadTextWhite">Hours Remaining</td>
	</tr>
</cfoutput>
<cfoutput query="get_sick_bank">
	<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif>>
		<td>#last_name#, #first_name#</td>
		<td align="right">#decimalformat(granted_hours)#</td>
		<td align="right">#decimalformat(used_hours)#</td>
		<td align="right">#decimalformat(remaining_hours)#</td>
	</tr>
</cfoutput>
</table>
