
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
		<td align="center" class="SubHeadText">Year</td>
		<td align="center" class="SubHeadText">Quarter</td>
		<td align="center" class="SubHeadText">Employees</td>
		<cfloop list="#reasons#" index="ii">
		<td align="center" class="SubHeadText"><cfoutput>#UCase(left(ii,1))##right(ii, len(ii)-1)#</cfoutput></td>
		<td align="center" class="SubHeadText"><cfoutput>#UCase(left(ii,1))##right(ii, len(ii)-1)#</cfoutput> Percent</td>
		</cfloop>
	</tr>

