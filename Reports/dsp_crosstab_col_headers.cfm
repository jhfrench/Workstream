
<!--Reports/dsp_crosstab_col_headers.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the column headers for the manager's cross tab report.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
	<tr bgcolor="#c0c0c0">
		<td class="SubHeadText">Code:</td>
	<!--- Display the Codes as Column headers --->			
		<cfoutput query="manager_crosstab_codes">
		<td align="center" class="SubHeadText">#manager_crosstab_codes.code#</td>
		</cfoutput>
		<td class="SubHeadText">Total</td>
	</tr>
