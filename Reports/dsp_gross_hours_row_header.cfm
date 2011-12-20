
<!--Reports/dsp_gross_hours_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr valign="bottom" bgcolor="##c0c0c0">
	<td class="RegText">Employee</td>
	<cfloop from="1" to="#variables.daysinmonth#" index="ii"><td align="center" class="RegText">
		#dateformat(variables.report_date, "mmm")#<br>#ii#
	</td></cfloop>
	<td class="RegText">
		Total
	</td>
</tr>
</cfoutput>

