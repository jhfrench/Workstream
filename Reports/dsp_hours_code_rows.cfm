
<!--Reports/dsp_hours_code_rows.cfm
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
	<tr class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td width="25">&nbsp;&nbsp;</td>
		<td><cfoutput>#employee_classification#</cfoutput></td>
		<td width="25">&nbsp;&nbsp;</td>
		<td width="60"><cfoutput>#decimalformat(hours)#</cfoutput><cfset total_hours=total_hours+hours></td>
		<td width="25">&nbsp;&nbsp;</td>
	</tr>
