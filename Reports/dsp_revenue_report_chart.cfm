
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
	Revision 1.1  2005/03/09 18:09:10  stetzer
	<>

	Revision 1.2  2001-10-30 11:39:12-05  french
	Made changes to accomodate new billing type (

	Revision 1.1  2001-10-11 11:04:29-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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
		<td align="center" class="SubHeadText#session.workstream_text_size#">Year</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Month</td>
		<td align="center" bgcolor="##BAEE9B" class="SubHeadText#session.workstream_text_size#">Flat-Rate</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Hourly</td>
		<td align="center" bgcolor="##BAEE9B" class="SubHeadText#session.workstream_text_size#">Per Incident</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Total Sales</td>
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
		<td align="center" class="RegText#session.workstream_text_size#"><cfif year NEQ temp_year>#year#<cfelse>&nbsp;</cfif></td>
		<td align="left" class="RegText#session.workstream_text_size#">#MonthAsString(month)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">#DecimalFormat(flat_revenue)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">#DecimalFormat(hour_revenue)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">#DecimalFormat(incident_revenue)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">#DollarFormat(month_revenue)#</td>
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
		<td align="right" colspan="2" class="RegText#session.workstream_text_size#">
			#year# YTD
		</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">
			#DollarFormat(ytd_flat)#<cfset ytd_flat=0>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DollarFormat(ytd_hour)#<cfset ytd_hour=0>
		</td>
		<td align="right" bgcolor="##BAEE9B" align="right" class="RegText#session.workstream_text_size#">
			#DollarFormat(ytd_incident)#<cfset ytd_incident=0>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DollarFormat(ytd_revenue)#<cfset ytd_revenue=0>
		</td>
	</tr>
	<cfset temp_year=year>
</cfif>
</cfoutput>
<cfoutput>
	<tr>
		<td align="center" colspan="2" class="SubHeadText#session.workstream_text_size#">&nbsp;</td>
		<td align="center" bgcolor="##BAEE9B" class="SubHeadText#session.workstream_text_size#">Flat-Rate</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Hourly</td>
		<td align="center" bgcolor="##BAEE9B" class="SubHeadText#session.workstream_text_size#">Per Incident</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Total Sales</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="center" class="RegText#session.workstream_text_size#">Totals:</td>
		<td align="center" class="RegText#session.workstream_text_size#">#revisedrecordcount# months</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(total_flat)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(total_hour)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(total_incident)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">&nbsp;#DollarFormat(total_revenue)#</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="left" colspan="2" class="RegText#session.workstream_text_size#">Monthly Average</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">&nbsp;<cfif revisedrecordcount>#DecimalFormat(total_flat/revisedrecordcount)#<cfelse>0</cfif></td>
		<td align="right" class="RegText#session.workstream_text_size#">&nbsp;<cfif revisedrecordcount>#DecimalFormat(total_hour/revisedrecordcount)#<cfelse>0</cfif></td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">&nbsp;<cfif revisedrecordcount>#DecimalFormat(total_incident/revisedrecordcount)#<cfelse>0</cfif></td>
		<td align="right" class="RegText#session.workstream_text_size#">&nbsp;<cfif revisedrecordcount>#DollarFormat(total_revenue/revisedrecordcount)#<cfelse>0</cfif></td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="left" colspan="2" class="RegText#session.workstream_text_size#">3 Month Average</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(tri_month_flat/3)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(tri_month_hour/3)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(tri_month_incident/3)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">&nbsp;#DollarFormat(tri_month_revenue/3)#</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td align="left" colspan="2" class="RegText#session.workstream_text_size#">12 Month Average</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(twelve_month_flat/12)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(twelve_month_hour/12)#</td>
		<td align="right" bgcolor="##BAEE9B" class="RegText#session.workstream_text_size#">&nbsp;#DecimalFormat(twelve_month_incident/12)#</td>
		<td align="right" class="RegText#session.workstream_text_size#">&nbsp;#DollarFormat(twelve_month_revenue/12)#</td>
	</tr>
</cfoutput>
</table>

