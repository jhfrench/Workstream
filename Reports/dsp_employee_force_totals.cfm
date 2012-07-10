
<!--Reports/dsp_employee_force_totals.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the summary for an employee's ForcePLanner report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##008080" class="SubHeadText">
		<td align="center" colspan="3" class="SubHeadTextWhite">
			Totals (#attributes.from_date# through #attributes.to_date#)
		</td>
	</tr>
	<tr bgcolor="##c0c0c0" class="SubHeadText">
		<td>
			&nbsp;
		</td>
		<td class="RegTextBd">
			You
		</td>
		<td class="RegTextBd">
			Nucleus
		</td>
	</tr>
	<tr bgcolor="##E1E1E1" class="SubHeadText">
		<td>
			Average number of days assigned to complete a task:
		</td>
		<td align="right">
			#decimalformat(employee_force_totals.given_days)#
		</td>
		<td align="right">
			#decimalformat(team_force_totals.given_days)#
		</td>
	</tr>
	<tr class="SubHeadText">
		<td>
			Average number of days used to complete a task:
		</td>
		<td align="right">
			#decimalformat(employee_force_totals.duration_days)#
		</td>
		<td align="right">
			#decimalformat(team_force_totals.duration_days)#
		</td>
	</tr>
	<tr bgcolor="##E1E1E1" class="SubHeadText">
		<td>
			Percent of tasks completed on time or early:
		</td>
		<td align="right">
			#decimalformat(employee_force_totals.on_time)#%
		</td>
		<td align="right">
			#decimalformat(team_force_totals.on_time)#%
		</td>
	</tr>
	<tr class="SubHeadText">
		<td>
			Percent of tasks completed on or under budget:
		</td>
		<td align="right">
			#decimalformat(employee_force_totals.on_budget)#%
		</td>
		<td align="right">
			#decimalformat(team_force_totals.on_budget)#%
		</td>
	</tr>
</cfoutput>

