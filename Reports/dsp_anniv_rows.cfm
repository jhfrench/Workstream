<!--Reports/dsp_anniv_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the anniversary report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput query="annivarsary">
<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif>>
	<td>#last_name#</td>
	<td>#first_name#</td>
	<td align="right">#dateformat(hire_date,"m/d/yyyy")#</td>
	<td align="right">#decimalformat(years_employed)#</td>
	<td align="right">#dateformat(birth_date,"mm/dd")#</td>
</tr>
</cfoutput>