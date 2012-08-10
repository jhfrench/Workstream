
<!-- Reports/dsp_manager_hours_total_hours.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the total hours for a report, I am used in the manager's
	hours report.

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr>
	   <td align="right" colspan="4">#dateformat(variables.compare_date, "m/d/yyyy")# Hours:</td>
	   <td>#decimalformat(variables.daily_total_hours)#</td>
	</tr>
	<cfset variables.compare_date=manager_hours_report_output.date>
	<cfset variables.daily_total_hours=0>
	<cfset variables.total_hours=variables.total_hours+1><!--- to account for the negative 1 --->
	<tr class="SubHeadText">
	    <td align="right" colspan="4">Total Hours: </td>
	  	<td>#variables.total_hours#</td>
  	</tr> 
</cfoutput>