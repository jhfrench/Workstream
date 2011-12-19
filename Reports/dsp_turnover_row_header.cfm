
<!--Reports/dsp_turnover_row_header.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column headers for the turnover report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
	<tr bgcolor="#c0c0c0">
		<td></td>
		<td align="center" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Year</td>
		<td align="center" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Quarter</td>
		<td align="center" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Employees</td>
		<cfloop list="#reasons#" index="ii">
		<td align="center" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>"><cfoutput>#UCase(left(ii,1))##right(ii, len(ii)-1)#</cfoutput></td>
		<td align="center" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>"><cfoutput>#UCase(left(ii,1))##right(ii, len(ii)-1)#</cfoutput> Percent</td>
		</cfloop>
	</tr>

