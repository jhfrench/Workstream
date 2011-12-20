<!--Reports/dsp_anniv_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the anniversary report.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput query="annivarsary">
<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif> class="RegText">
	<td>#lname#</td>
	<td>#name#</td>
	<td align="right">#dateformat(hire_date,"mm/dd/yyyy")#</td>
	<td align="right">#decimalformat(years_employed)#</td>
	<td align="right">#dateformat(dob,"mm/dd")#</td>
</tr>
</cfoutput>