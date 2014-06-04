
<!--Reports/pag_anniversary_report.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the anniversary report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfinclude template="qry_get_annivarsaries.cfm">
<table class="table table-striped table-bordered table-condensed">
	<caption><h1>Anniversary Report</h1></caption>
	<thead>
		<tr>
			<th>Last Name</th>
			<th>First Name</th>
			<th>Date of Hire</th>
			<th>Tenure (years)</th>
			<th>Birthday</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_annivarsaries">
		<tr>
			<td>#last_name#</td>
			<td>#first_name#</td>
			<td class="date">#dateformat(hire_date,"mm/dd/yyyy")#</td>
			<td class="number">#decimalformat(years_employed)#</td>
			<td class="date">#dateformat(birth_date,"mm/dd")#</td>
		</tr>
	</cfoutput>
	</tbody>
</table>
