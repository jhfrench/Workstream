
<!--Reports/dsp_code_reports.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the code report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.2  2005/03/18 15:19:30  french
	Adding customer description to project name display.

	Revision 1.1  2005-03-09 13:04:50-05  stetzer
	<>

	Revision 1.2  2002-02-08 16:53:15-05  french
	Changing format to match other reports.

	Revision 1.1  2001-10-11 11:04:50-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	
	(KL | 8/7/01) Removed an extra incrementing of the employee type totals.
	||
	END FUSEDOC --->
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
	<cfset "variables.period_total_#ii#"=0>
</cfloop>
</cfif>
</cfsilent>
<cfoutput query="#query#" group="employee_classification">
<cfif len(employee_classification)>
	<cfset variables.employee_classification=employee_classification>
<cfelse>
	<cfset variables.employee_classification="Regular Employee">
</cfif>
	<tr class="SubHeadText#session.workstream_text_size#">
		<td bgcolor="##c0c0c0" colspan="#variables.column_count#" class="SubHeadText#session.workstream_text_size#">
			#variables.employee_classification#
		</td>
	</tr>
	<tr>
		<td nowrap class="RegText#session.workstream_text_size#Bd">
			Customer
		</td>
		<td nowrap class="RegText#session.workstream_text_size#Bd">
			Name
		</td>
<cfif variables.month_loop GT 1>
	<cfset variables.display_month=dateformat(variables.from_date, "mmm/yy")>
	<cfloop from="1" to="#variables.month_loop#" index="ii">
	<cfset "variables.sum_period_#ii#"=0>
		<td align="center" class="RegText#session.workstream_text_size#Bd">
			&nbsp;#variables.display_month# Hours&nbsp;
			<cfset variables.display_month=dateformat(dateadd("m",ii,variables.from_date), "mmm/yy")>
		</td>
	</cfloop>
</cfif>
		<td align="center" class="RegText#session.workstream_text_size#Bd">
			&nbsp;Total Hours&nbsp;
		</td><cfif variables.month_loop LT 2>
		<td align="center" class="RegText#session.workstream_text_size#Bd">
			&nbsp;Code Subtotal&nbsp;
		</td>
		<td align="center" class="RegText#session.workstream_text_size#Bd">
			&nbsp;Employee Type Subtotal&nbsp;
		</td></cfif>
	</tr>
<cfoutput group="clientcode">
<cfoutput>
	<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif> class="RegText#session.workstream_text_size#">
		<td nowrap class="RegText#session.workstream_text_size#">#clientName#&nbsp;</td>
		<td nowrap class="RegText#session.workstream_text_size#">#lname#, #name#&nbsp;</td>
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
		<cfset "variables.sum_period_#ii#"=evaluate("period_#ii#")+evaluate("variables.sum_period_#ii#")>
		<td align="right" class="RegText#session.workstream_text_size#">#decimalformat(evaluate("period_#ii#"))#</td>
</cfloop>
</cfif>
		<td align="right" class="RegText#session.workstream_text_size#">#decimalformat(hours)#</td>
		<cfset total_hours=total_hours+hours><cfset variables.emp_type_hours=hours+emp_type_hours>
	</tr>
</cfoutput>
	<tr valign="top" class="RegText#session.workstream_text_size#">
		<td colspan="<cfif variables.month_loop GT 1>2<cfelse>3</cfif>" align="right"  class="RegText#session.workstream_text_size#It">
			<cfif variables.month_loop GT 1>#variables.employee_classification#<cfelse>#clientname#</cfif> Hour Totals: 
		</td>
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
	<cfset "variables.period_total_#ii#"=evaluate("variables.sum_period_#ii#")+evaluate("variables.period_total_#ii#")>
		<td align="right" class="RegText#session.workstream_text_size#">#decimalformat(evaluate("variables.sum_period_#ii#"))#</td>
</cfloop>
</cfif>
		<td align="right" class="RegText#session.workstream_text_size#">
			#decimalformat(total_hours)#<cfset variables.total_hours=0>
		</td>
	</tr>
</cfoutput>
<cfif variables.month_loop LT 2>
	<tr class="SubHeadText#session.workstream_text_size#">
		<td colspan="4" align="right"  class="SubHeadText#session.workstream_text_size#">
			Total Hours for #variables.employee_classification#:
		</td>
		<td align="right" class="SubHeadText#session.workstream_text_size#">
			#DecimalFormat(Emp_Type_Hours)#
		</td>
	</tr>
</cfif>
		<cfset variables.grand_total_hours=emp_type_hours+grand_total_hours><cfset variables.emp_type_hours=0>
</cfoutput>
<cfoutput>
<!-- I only want this after the client code changes -->
	<tr>
		<td colspan="#variables.column_count#">
			&nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td align="right" colspan="2" class="SubHeadText#session.workstream_text_size#">
			Grand Total Hours:
		</td>
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
		<td align="right" class="SubHeadText#session.workstream_text_size#">#decimalformat(evaluate("variables.period_total_#ii#"))#</td>
</cfloop>
</cfif>
		<td align="right" class="SubHeadText#session.workstream_text_size#">
			#DecimalFormat(grand_total_hours)#
		</td>
	</tr>
</cfoutput>

