
<!--Reports/dsp_employee_force_row.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the rows for the employee's ForcePlanner report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput query="employee_force">
	<tr<cfif (currentrow MOD 2) EQ 0> bgcolor="##E1E1E1"</cfif> class="SubHeadText">
		<td>
			#engagement#
		</td>
		<td>
			<a href="javascript:list_to_task('#task_id#');">#task#</a>
		</td>
		<td>
			#billable#
		</td>
		<td>
			#priority#
		</td>
		<td>
			#status#
		</td>
		<td>
			#dateformat(date_due,"mm/dd/yy")#
		</td>
		<td class="RegText<cfif on_time EQ 0>Red</cfif>">
			#dateformat(date_completed,"mm/dd/yy")#
		</td>
		<td class="RegText<cfif on_budget EQ 0>Red</cfif>">
			<cfif listgetat(hours_used,2,".") GT 0>#decimalformat(hours_used)#<cfelse>#numberformat(hours_used)#</cfif><cfif budgeted_hours GT 0>/#decimalformat(budgeted_hours)# #numberformat(budget_used)#%</cfif>
		</td>
	</tr>
</cfoutput>

