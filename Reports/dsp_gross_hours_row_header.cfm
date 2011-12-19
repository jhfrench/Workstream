
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr valign="bottom" bgcolor="##c0c0c0">
	<td class="RegText#session.workstream_text_size#">Employee</td>
	<cfloop from="1" to="#variables.daysinmonth#" index="ii"><td align="center" class="RegText#session.workstream_text_size#">
		#DateFormat(variables.report_date, "mmm")#<br>#ii#
	</td></cfloop>
	<td class="RegText#session.workstream_text_size#">
		Total
	</td>
</tr>
</cfoutput>

