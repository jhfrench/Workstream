
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
		<th>Employee</th><cfloop from="1" to="#variables.daysinmonth#" index="ii">
		<th<cfif listfind("1,7", dayofweek(createodbcdate("#attributes.month#/#ii#/#attributes.year#")))> bgcolor="##00ffff"</cfif>>#ii#</th></cfloop>
		<th>Total</th>
	</tr>
</cfoutput>
