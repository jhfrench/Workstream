
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
Revision 1.1  2005/03/09 18:05:44  stetzer
<>

Revision 1.1  2001-10-11 11:04:46-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput query="employee_force">
	<tr<cfif (currentrow MOD 2) EQ 0> bgcolor="##E1E1E1"</cfif> class="SubHeadText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			#engagement#
		</td>
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_task('#task_id#');" onmouseover="MM_displayStatusMsg('View task details for this task.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#task#</a>
		</td>
		<td class="RegText#session.workstream_text_size#">
			#billable#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#priority#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#status#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#DateFormat(date_due,"mm/dd/yy")#
		</td>
		<td class="RegText#session.workstream_text_size#<cfif on_time EQ 0>Red</cfif>">
			#DateFormat(date_completed,"mm/dd/yy")#
		</td>
		<td class="RegText#session.workstream_text_size#<cfif on_budget EQ 0>Red</cfif>">
			<cfif listgetat(hours_used,2,".") GT 0>#DecimalFormat(hours_used)#<cfelse>#numberformat(hours_used)#</cfif><cfif budgeted_hours GT 0>/#DecimalFormat(budgeted_hours)# #numberformat(budget_used)#%</cfif>
		</td>
	</tr>
</cfoutput>

