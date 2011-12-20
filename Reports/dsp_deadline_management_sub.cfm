
<!--Reports/dsp_deadline_management_sub.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Deadline Management Report that shows data per employee.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> emp_id: number that uniquely identifies an employee
	--> lname: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> on_time: decimal number that indicates the percent of tasks an employee has completed on time or early in the specified month
	END FUSEDOC --->
</cfsilent>
<table align="left" border="0" cellpadding="1" cellspacing="0" width="40%">
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="SubHeadTextWhite">
			Deadline Management for 
			<select name="admin_month" onchange="javascript:document.admin_planning.submit();" class="RegText">
				<cfloop from="1" to="12" index="ii">
				<option value="#ii#"<cfif attributes.admin_month EQ ii> selected</cfif>>#monthAsString(ii)#</option></cfloop>
			</select>
			<select name="admin_year" onchange="javascript:document.admin_planning.submit();" class="RegText">
				<cfloop from="#lowest_year#" to="#year(now())#" index="ii">
				<option value="#ii#"<cfif attributes.admin_year EQ ii> selected</cfif>>#ii#</option></cfloop>
			</select>
		</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText">
			Team member
		</td>
		<td class="SubHeadText">
			Percent
		</td>
	</tr>
</cfoutput>
<cfoutput query="deadline_management_sub">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td class="RegText">
			<a href="javascript:list_to_employee('#emp_id#')" onmouseover="MM_displayStatusMsg('View details for #Replace(name,"'","")# #Replace(lname,"'","")#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#lname#, #name#</a>
		</td>
		<td align="right" class="RegText">
			#decimalformat(on_time)#
		</td>
	</tr>
</cfoutput>
<cfoutput>
	<tr>
		<td colspan="2" class="Note">
			Employees who have no tasks due in #MonthAsString(attributes.admin_month)# of #attributes.admin_year# will not appear in this table.
		</td>
	</tr>
</cfoutput>
</table>

