
<!--Reports/dsp_revenue_report_chart.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report chart (table).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->
<cfset variables.temp_year=0>
<cfset tri_month_flat=0>
<cfset tri_month_hour=0>
<cfset tri_month_incident=0>
<cfset tri_month_revenue=0>
<cfset twelve_month_flat=0>
<cfset twelve_month_hour=0>
<cfset twelve_month_incident=0>
<cfset twelve_month_revenue=0>
<cfset total_flat=0>
<cfset total_hour=0>
<cfset total_incident=0>
<cfset total_revenue=0>
<cfset ytd_flat=0>
<cfset ytd_hour=0>
<cfset ytd_incident=0>
<cfset ytd_revenue=0>
</cfsilent>
<cfinclude template="../common_files/act_table_sorting.cfm">
<table class="table table-striped table-bordered table-condensed tablesorter">
	<caption><h3>Monthly Sales</h3></caption>
	<thead>
		<tr>
			<th>Month</th>
			<th>Flat-Rate</th>
			<th>Hourly</th>
			<th>Per Incident</th>
			<th>Total Sales</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_revenue_report">
	<cfif month_revenue GT 0 OR (hour_revenue GT 0 OR flat_revenue GT 0 OR incident_revenue GT 0)>
		<cfif currentrow LT 12>
			<cfset twelve_month_flat=twelve_month_flat+flat_revenue>
			<cfset twelve_month_hour=twelve_month_hour+hour_revenue>
			<cfset twelve_month_incident=twelve_month_incident+incident_revenue>
			<cfset twelve_month_revenue=twelve_month_revenue+month_revenue>
			<cfif currentrow LT 3>
				<cfset tri_month_flat=tri_month_flat+flat_revenue>
				<cfset tri_month_hour=tri_month_hour+hour_revenue>
				<cfset tri_month_incident=tri_month_incident+incident_revenue>
				<cfset tri_month_revenue=tri_month_revenue+month_revenue>
			</cfif>
		</cfif>
		<cfset ytd_flat=ytd_flat+flat_revenue>
		<cfset ytd_hour=ytd_hour+hour_revenue>
		<cfset ytd_incident=ytd_incident+incident_revenue>
		<cfset ytd_revenue=ytd_revenue+month_revenue>
		<tr>
			<td scope="row"><span class="hidden">#year##month#</span>#monthasstring(month)#-#year#</td>
			<td class="number">#decimalformat(flat_revenue)#</td>
			<td class="number">#decimalformat(hour_revenue)#</td>
			<td class="number">#decimalformat(incident_revenue)#</td>
			<td class="number">#dollarformat(month_revenue)#</td>
		</tr>
	</cfif>
	<cfif month EQ 1 OR currentrow EQ recordcount>
		<cfset total_flat=total_flat+ytd_flat>
		<cfset total_hour=total_hour+ytd_hour>
		<cfset total_incident=total_incident+ytd_incident>
		<cfset total_revenue=total_revenue+ytd_revenue>
		<tr class="info">
			<td scope="row"><strong>#year# <cfif year EQ year(now())><abbr title="Year To Date">YTD</abbr><cfelse>Totals</cfif></strong></td>
			<td class="number">#dollarformat(ytd_flat)#<cfset ytd_flat=0></td>
			<td class="number">#dollarformat(ytd_hour)#<cfset ytd_hour=0></td>
			<td class="number">#dollarformat(ytd_incident)#<cfset ytd_incident=0></td>
			<td class="number">#dollarformat(ytd_revenue)#<cfset ytd_revenue=0></td>
		</tr>
		<cfset variables.temp_year=year>
	</cfif>
	</cfoutput>
	</tbody>
	<tfoot>
	<cfoutput>
		<tr>
			<td>&nbsp;</td>
			<td bgcolor="##BAEE9B">Flat-Rate</td>
			<td>Hourly</td>
			<td bgcolor="##BAEE9B">Per Incident</td>
			<td>Total Sales</td>
		</tr>
		<tr bgcolor="##c0c0c0">
			<td>All #get_revenue_report.recordcount# months</td>
			<td class="number" bgcolor="##BAEE9B">&nbsp;#decimalformat(total_flat)#</td>
			<td class="number">&nbsp;#decimalformat(total_hour)#</td>
			<td class="number" bgcolor="##BAEE9B">&nbsp;#decimalformat(total_incident)#</td>
			<td class="number">&nbsp;#dollarformat(total_revenue)#</td>
		</tr>
		<tr bgcolor="##c0c0c0">
			<td>Monthly Average</td>
			<td class="number" bgcolor="##BAEE9B">&nbsp;<cfif get_revenue_report.recordcount>#decimalformat(total_flat/get_revenue_report.recordcount)#<cfelse>0</cfif></td>
			<td class="number">&nbsp;<cfif get_revenue_report.recordcount>#decimalformat(total_hour/get_revenue_report.recordcount)#<cfelse>0</cfif></td>
			<td class="number" bgcolor="##BAEE9B">&nbsp;<cfif get_revenue_report.recordcount>#decimalformat(total_incident/get_revenue_report.recordcount)#<cfelse>0</cfif></td>
			<td class="number">&nbsp;<cfif get_revenue_report.recordcount>#dollarformat(total_revenue/get_revenue_report.recordcount)#<cfelse>0</cfif></td>
		</tr>
		<tr bgcolor="##c0c0c0">
			<td>3 Month Rolling Average</td>
			<td class="number" bgcolor="##BAEE9B">&nbsp;#decimalformat(tri_month_flat/3)#</td>
			<td class="number">&nbsp;#decimalformat(tri_month_hour/3)#</td>
			<td class="number" bgcolor="##BAEE9B">&nbsp;#decimalformat(tri_month_incident/3)#</td>
			<td class="number">&nbsp;#dollarformat(tri_month_revenue/3)#</td>
		</tr>
		<tr bgcolor="##c0c0c0">
			<td>12 Month Rolling Average</td>
			<td class="number" bgcolor="##BAEE9B">&nbsp;#decimalformat(twelve_month_flat/12)#</td>
			<td class="number">&nbsp;#decimalformat(twelve_month_hour/12)#</td>
			<td class="number" bgcolor="##BAEE9B">&nbsp;#decimalformat(twelve_month_incident/12)#</td>
			<td class="number">&nbsp;#dollarformat(twelve_month_revenue/12)#</td>
		</tr>
	</cfoutput>
	</tfoot>
</table>

