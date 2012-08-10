
<!--Reports/dsp_manager_hours_rows.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the manager hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfset variables.total_hours=variables.total_hours+hours>

<cfoutput>
<cfif variables.total_hours NEQ -1>

	<cfif NOT len(variables.compare_date)>
		<cfset variables.compare_date=manager_hours_report_output.date>

	</cfif>
	<cfif len(manager_hours_report_output.date)>
		<cfif datecompare(manager_hours_report_output.date, variables.compare_date) NEQ 0>
			<tr>
			   <td align="right" colspan="4">#dateformat(variables.compare_date, "mm/dd/yyyy")# Hours:</td>
			   <td>#decimalformat(variables.daily_total_hours)#</td>
			</tr>
			<cfset variables.compare_date=manager_hours_report_output.date>
			<cfset variables.daily_total_hours=0>
			<cfset variables.daily_total_hours=variables.daily_total_hours+hours>
		<cfelse>
			<cfset variables.daily_total_hours=variables.daily_total_hours+hours>
		</cfif>
	<cfelse>
		<cfset variables.daily_total_hours=variables.daily_total_hours+hours>
	</cfif>
	<tr>
	   <td bgcolor="##e1e1e1">#dateformat(date, "mm/dd/yyyy")#</td>
	   <td bgcolor="##e1e1e1">#display#</td>
	   <td bgcolor="##e1e1e1">#note#</td>
	   <td bgcolor="##e1e1e1">#decimalformat(hours)#</td>
	</tr>
  <cfelse>
	<tr>
		<td align="center" colspan="5" class="SubHeadText">
	  		No timekeeping records match the criteria for this employee.
		</td>
	</tr>
 </cfif>
</cfoutput>
