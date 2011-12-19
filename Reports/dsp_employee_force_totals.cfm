
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
Revision 1.1  2005/03/09 18:05:49  stetzer
<>

Revision 1.1  2001-10-11 11:04:46-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##008080" class="SubHeadText#session.workstream_text_size#">
		<td align="center" colspan="3" class="SubHeadText#session.workstream_text_size#White">
			Totals (#attributes.from_date# through #attributes.to_date#)
		</td>
	</tr>
	<tr bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			&nbsp;
		</td>
		<td class="RegText#session.workstream_text_size#Bd">
			You
		</td>
		<td class="RegText#session.workstream_text_size#Bd">
			Nucleus
		</td>
	</tr>
	<tr bgcolor="##E1E1E1" class="SubHeadText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			Average number of days assigned to complete a task:
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(employee_force_totals.given_days)#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(team_force_totals.given_days)#
		</td>
	</tr>
	<tr class="SubHeadText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			Average number of days used to complete a task:
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(employee_force_totals.duration_days)#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(team_force_totals.duration_days)#
		</td>
	</tr>
	<tr bgcolor="##E1E1E1" class="SubHeadText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			Percent of tasks completed on time or early:
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(employee_force_totals.on_time)#%
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(team_force_totals.on_time)#%
		</td>
	</tr>
	<tr class="SubHeadText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			Percent of tasks completed on or under budget:
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(employee_force_totals.on_budget)#%
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(team_force_totals.on_budget)#%
		</td>
	</tr>
</cfoutput>

