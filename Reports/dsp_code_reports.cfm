
<!--Reports/dsp_code_reports.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the code report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
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
	<tr class="SubHeadText">
		<td bgcolor="##c0c0c0" colspan="#variables.column_count#" class="SubHeadText">
			#variables.employee_classification#
		</td>
	</tr>
	<tr>
		<td nowrap class="RegTextBd">
			Customer
		</td>
		<td nowrap class="RegTextBd">
			Name
		</td>
<cfif variables.month_loop GT 1>
	<cfset variables.display_month=dateformat(variables.from_date, "mmm/yy")>
	<cfloop from="1" to="#variables.month_loop#" index="ii">
	<cfset "variables.sum_period_#ii#"=0>
		<td align="center" class="RegTextBd">
			&nbsp;#variables.display_month# Hours&nbsp;
			<cfset variables.display_month=dateformat(dateadd("m",ii,variables.from_date), "mmm/yy")>
		</td>
	</cfloop>
</cfif>
		<td align="center" class="RegTextBd">
			&nbsp;Total Hours&nbsp;
		</td><cfif variables.month_loop LT 2>
		<td align="center" class="RegTextBd">
			&nbsp;Code Subtotal&nbsp;
		</td>
		<td align="center" class="RegTextBd">
			&nbsp;Employee Type Subtotal&nbsp;
		</td></cfif>
	</tr>
<cfoutput group="clientcode">
<cfoutput>
	<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif>>
		<td nowrap>#clientName#&nbsp;</td>
		<td nowrap>#lname#, #name#&nbsp;</td>
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
		<cfset "variables.sum_period_#ii#"=evaluate("period_#ii#")+evaluate("variables.sum_period_#ii#")>
		<td align="right">#decimalformat(evaluate("period_#ii#"))#</td>
</cfloop>
</cfif>
		<td align="right">#decimalformat(hours)#</td>
		<cfset total_hours=total_hours+hours><cfset variables.emp_type_hours=hours+emp_type_hours>
	</tr>
</cfoutput>
	<tr valign="top">
		<td colspan="<cfif variables.month_loop GT 1>2<cfelse>3</cfif>" align="right" class="RegTextIt">
			<cfif variables.month_loop GT 1>#variables.employee_classification#<cfelse>#clientname#</cfif> Hour Totals: 
		</td>
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
	<cfset "variables.period_total_#ii#"=evaluate("variables.sum_period_#ii#")+evaluate("variables.period_total_#ii#")>
		<td align="right">#decimalformat(evaluate("variables.sum_period_#ii#"))#</td>
</cfloop>
</cfif>
		<td align="right">
			#decimalformat(total_hours)#<cfset variables.total_hours=0>
		</td>
	</tr>
</cfoutput>
<cfif variables.month_loop LT 2>
	<tr class="SubHeadText">
		<td colspan="4" align="right" class="SubHeadText">
			Total Hours for #variables.employee_classification#:
		</td>
		<td align="right" class="SubHeadText">
			#decimalformat(Emp_Type_Hours)#
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
		<td align="right" colspan="2" class="SubHeadText">
			Grand Total Hours:
		</td>
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
		<td align="right" class="SubHeadText">#decimalformat(evaluate("variables.period_total_#ii#"))#</td>
</cfloop>
</cfif>
		<td align="right" class="SubHeadText">
			#decimalformat(grand_total_hours)#
		</td>
	</tr>
</cfoutput>

