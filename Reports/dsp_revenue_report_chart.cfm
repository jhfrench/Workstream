
<!--Reports/dsp_revenue_report_chart.cfm
	Author: Jeromy F  -->
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
<cfset temp_year=0>
<cfset revisedrecordcount=0>
<cfset counter=0>
<cfset counter2=0>
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
<table align="right" border="0" cellpadding="1" cellspacing="0">
<cfoutput>
	<tr>
		<td align="center" class="SubHeadText">Year</td>
		<td align="center" class="SubHeadText">Month</td>
		<td align="center" bgcolor="##BAEE9B" class="SubHeadText">Flat-Rate</td>
		<td align="center" class="SubHeadText">Hourly</td>
		<td align="center" bgcolor="##BAEE9B" class="SubHeadText">Per Incident</td>
		<td align="center" class="SubHeadText">Total Sales</td>
	</tr>
</cfoutput>
<cfoutput query="revenue_report">
<cfif month_revenue GT 0 OR (hour_revenue GT 0 OR flat_revenue GT 0 OR incident_revenue GT 0)>
<cfset revisedrecordcount=IncrementValue(revisedrecordcount)>
<cfif counter LT 3>
	<cfset tri_month_flat=tri_month_flat+flat_revenue>
	<cfset tri_month_hour=tri_month_hour+hour_revenue>
	<cfset tri_month_incident=tri_month_incident+incident_revenue>
	<cfset tri_month_revenue=tri_month_revenue+month_revenue>
	<cfset counter=IncrementValue(counter)>
</cfif>
<cfif counter2 LT 12>
	<cfset twelve_month_flat=twelve_month_flat+flat_revenue>
	<cfset twelve_month_hour=twelve_month_hour+hour_revenue>
	<cfset twelve_month_incident=twelve_month_incident+incident_revenue>
	<cfset twelve_month_revenue=twelve_month_revenue+month_revenue>
	<cfset counter2=IncrementValue(counter2)>
</cfif>
	<cfset ytd_flat=ytd_flat+flat_revenue>
	<cfset ytd_hour=ytd_hour+hour_revenue>
	<cfset ytd_incident=ytd_incident+incident_revenue>
	<cfset ytd_revenue=ytd_revenue+month_revenue>
	<tr>
		<td align="center" class="RegText"><cfif year NEQ temp_year>#year#<cfelse>&nbsp;</cfif></td>
		<td align="left" class="RegText">#MonthAsString(month)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">#decimalformat(flat_revenue)#</td>
		<td align="right" class="RegText">#decimalformat(hour_revenue)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">#decimalformat(incident_revenue)#</td>
		<td align="right" class="RegText">#dollarformat(month_revenue)#</td>
	</tr>
</cfif>
<cfif month EQ 1>
	<cfset total_flat=total_flat+ytd_flat>
	<cfset total_hour=total_hour+ytd_hour>
	<cfset total_incident=total_incident+ytd_incident>
	<cfset total_revenue=total_revenue+ytd_revenue>
	<tr bgcolor="##000000">
		<td colspan="6" height="1"></td>
	</tr>
	<tr bgcolor="##E1E1E1">
		<td align="right" colspan="2" class="RegText">
			#year# YTD
		</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">
			#dollarformat(ytd_flat)#<cfset ytd_flat=0>
		</td>
		<td align="right" class="RegText">
			#dollarformat(ytd_hour)#<cfset ytd_hour=0>
		</td>
		<td align="right" bgcolor="##BAEE9B" align="right" class="RegText">
			#dollarformat(ytd_incident)#<cfset ytd_incident=0>
		</td>
		<td align="right" class="RegText">
			#dollarformat(ytd_revenue)#<cfset ytd_revenue=0>
		</td>
	</tr>
	<cfset temp_year=year>
</cfif>
</cfoutput>
<cfoutput>
	<tr>
		<td align="center" colspan="2" class="SubHeadText">&nbsp;</td>
		<td align="center" bgcolor="##BAEE9B" class="SubHeadText">Flat-Rate</td>
		<td align="center" class="SubHeadText">Hourly</td>
		<td align="center" bgcolor="##BAEE9B" class="SubHeadText">Per Incident</td>
		<td align="center" class="SubHeadText">Total Sales</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="center" class="RegText">Totals:</td>
		<td align="center" class="RegText">#revisedrecordcount# months</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">&nbsp;#decimalformat(total_flat)#</td>
		<td align="right" class="RegText">&nbsp;#decimalformat(total_hour)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">&nbsp;#decimalformat(total_incident)#</td>
		<td align="right" class="RegText">&nbsp;#dollarformat(total_revenue)#</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="left" colspan="2" class="RegText">Monthly Average</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">&nbsp;<cfif revisedrecordcount>#decimalformat(total_flat/revisedrecordcount)#<cfelse>0</cfif></td>
		<td align="right" class="RegText">&nbsp;<cfif revisedrecordcount>#decimalformat(total_hour/revisedrecordcount)#<cfelse>0</cfif></td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">&nbsp;<cfif revisedrecordcount>#decimalformat(total_incident/revisedrecordcount)#<cfelse>0</cfif></td>
		<td align="right" class="RegText">&nbsp;<cfif revisedrecordcount>#dollarformat(total_revenue/revisedrecordcount)#<cfelse>0</cfif></td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="left" colspan="2" class="RegText">3 Month Average</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">&nbsp;#decimalformat(tri_month_flat/3)#</td>
		<td align="right" class="RegText">&nbsp;#decimalformat(tri_month_hour/3)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">&nbsp;#decimalformat(tri_month_incident/3)#</td>
		<td align="right" class="RegText">&nbsp;#dollarformat(tri_month_revenue/3)#</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="left" colspan="2" class="RegText">12 Month Average</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">&nbsp;#decimalformat(twelve_month_flat/12)#</td>
		<td align="right" class="RegText">&nbsp;#decimalformat(twelve_month_hour/12)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText">&nbsp;#decimalformat(twelve_month_incident/12)#</td>
		<td align="right" class="RegText">&nbsp;#dollarformat(twelve_month_revenue/12)#</td>
	</tr>
</cfoutput>
</table>

