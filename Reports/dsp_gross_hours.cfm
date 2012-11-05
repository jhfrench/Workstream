
<!--Reports/dsp_gross_hours_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the gross hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<table class="table table-striped table-bordered table-condensed">
	<caption>
		<h2>
			Gross Hours Report<br />
			<small>for <cfoutput>#monthasstring(attributes.work_month)#, #attributes.work_year#</cfoutput></small>
		</h2>
	</caption>
<cfif get_gross_hours.recordcount>
	<thead>
	<cfoutput>
		<tr>
			<th>Employee</th><cfloop from="1" to="#variables.daysinmonth#" index="ii">
			<th<cfif listfind("1,7", dayofweek(createodbcdate("#attributes.work_month#/#ii#/#attributes.work_year#")))> bgcolor="##00ffff"</cfif>>#ii#</th></cfloop>
			<th>Total</th>
		</tr>
	</cfoutput>
	</thead>
	<tfoot>
	<cfoutput query="get_gross_hours_total">
		<tr>
			<td>Total</td><cfloop from="1" to="#variables.daysinmonth#" index="ii">
			<cfset variables.day_hours=evaluate("day#ii#")>
			<td class="number"><cfif variables.day_hours>#decimalformat(variables.day_hours)#<cfelse>0</cfif></td></cfloop>
			<td class="number">#decimalformat(total)#</td>
		</tr>
	</cfoutput>
	</tfoot>
	<tbody>
	<cfoutput query="get_gross_hours">
		<tr>
			<td>#name#</td><cfloop from="1" to="#variables.daysinmonth#" index="ii">
			<cfset variables.day_hours=evaluate("day#ii#")>
			<td class="number"><cfif variables.day_hours>#decimalformat(variables.day_hours)#<cfelse>0</cfif></td></cfloop>
			<td class="number">#decimalformat(total)#</td>
		</tr>
	</cfoutput>
	</tbody>
<cfelse>
		<tr>
			<td>No records match your criteria</td>
		</tr>
</cfif>
</table>