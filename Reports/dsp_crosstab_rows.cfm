
<!--Reports/dsp_crosstab_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I output the rows for the manager's crosstab report

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>

<!--- Loop through each subordinate and Display the names of the subordinates and  the hours they entered for each code--->	
		<cfoutput query="manager_crosstab_hours">
			<tr<cfif manager_crosstab_hours.currentrow MOD 2> bgcolor="##e1e1e1"</cfif>>	
				<td nowrap>#manager_crosstab_hours.name#</td>
			<cfloop from="1" to="#manager_crosstab_codes.recordcount#" index="ii">
				<td align="right">#decimalformat(evaluate("manager_crosstab_hours.code#ii#"))#</td>
			</cfloop>
				<td align="right">#decimalformat(manager_crosstab_hours.total_hours)#</td>
			</tr>
		</cfoutput>

