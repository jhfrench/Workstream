
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

<table class="table table-striped table-bordered table-condensed">
	<caption>
	<cfoutput>
		<h2>#attributes.report_name#</h2>
		<h3>for #attributes.from_date#&nbsp;through&nbsp;#attributes.through_date#</h3>
	</cfoutput>
	</caption>
<cfoutput query="#variables.query#" group="employee_classification">
<cfif len(employee_classification)>
	<cfset variables.employee_classification=employee_classification>
<cfelse>
	<cfset variables.employee_classification="Regular Employee">
</cfif>
	<tr>
		<td colspan="#variables.column_count#">
			#variables.employee_classification#
		</td>
	</tr>
	<tr>
		<td>
			Customer
		</td>
		<td>
			Name
		</td>
<cfif variables.month_loop GT 1>
	<cfset variables.display_month=dateformat(variables.from_date, "mmm/yy")>
	<cfloop from="1" to="#variables.month_loop#" index="ii">
	<cfset "variables.sum_period_#ii#"=0>
		<td>
			&nbsp;#variables.display_month# Hours&nbsp;
			<cfset variables.display_month=dateformat(dateadd("m",ii,variables.from_date), "mmm/yy")>
		</td>
	</cfloop>
</cfif>
		<td>
			&nbsp;Total Hours&nbsp;
		</td><cfif variables.month_loop LT 2>
		<td>
			&nbsp;Code Subtotal&nbsp;
		</td>
		<td>
			&nbsp;Employee Type Subtotal&nbsp;
		</td></cfif>
	</tr>
<cfoutput group="project_code">
<cfoutput>
	<tr<cfif currentrow MOD 2> bgcolor="##e1e1e1"</cfif>>
		<td>#clientName#&nbsp;</td>
		<td>#last_name#, #first_name#&nbsp;</td>
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
		<cfset "variables.sum_period_#ii#"=evaluate("period_#ii#")+evaluate("variables.sum_period_#ii#")>
		<td class="number">#decimalformat(evaluate("period_#ii#"))#</td>
</cfloop>
</cfif>
		<td class="number">#decimalformat(hours)#</td>
		<cfset total_hours=total_hours+hours><cfset variables.emp_type_hours=hours+variables.emp_type_hours>
	</tr>
</cfoutput>
	<tr valign="top">
		<td colspan="<cfif variables.month_loop GT 1>2<cfelse>3</cfif>" align="right" class="RegTextIt">
			<cfif variables.month_loop GT 1>#variables.employee_classification#<cfelse>#clientname#</cfif> Hour Totals:
		</td>
<cfif variables.month_loop GT 1>
<cfloop from="1" to="#variables.month_loop#" index="ii">
	<cfset "variables.period_total_#ii#"=evaluate("variables.sum_period_#ii#")+evaluate("variables.period_total_#ii#")>
		<td class="number">#decimalformat(evaluate("variables.sum_period_#ii#"))#</td>
</cfloop>
</cfif>
		<td class="number">
			#decimalformat(total_hours)#<cfset variables.total_hours=0>
		</td>
	</tr>
</cfoutput>
<cfif variables.month_loop LT 2>
	<tr class="SubHeadText">
		<td colspan="4">
			Total Hours for #variables.employee_classification#:
		</td>
		<td class="number">
			#decimalformat(variables.emp_type_hours)#
		</td>
	</tr>
</cfif>
		<cfset variables.grand_total_hours=variables.emp_type_hours+variables.grand_total_hours><cfset variables.emp_type_hours=0>
</cfoutput>
	<tfoot>
	<cfoutput>
	<!-- I only want this after the client code changes -->
		<tr>
			<td colspan="#variables.column_count#">
				&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="2">
				Grand Total Hours:
			</td>
	<cfif variables.month_loop GT 1>
	<cfloop from="1" to="#variables.month_loop#" index="ii">
			<td class="number">#decimalformat(evaluate("variables.period_total_#ii#"))#</td>
	</cfloop>
	</cfif>
			<td class="number">
				#decimalformat(variables.grand_total_hours)#
			</td>
		</tr>
	</cfoutput>
	</tfoot>
</table>
