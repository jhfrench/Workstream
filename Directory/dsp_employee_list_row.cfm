
<!--Directory/dsp_employee_list_row.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	--> company: id that identifies the user's company
	--> email: string containing the email address of an employee
	--> emp_id: id that identifies user to workstream
	--> extension: string containing the extension of an employee
	--> lname: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> phone_number: string containing the work phone number of an employee
 --->
<cfset list1="(,), ,-,x,.">
<cfset list2=",,,,,">
</cfsilent>
<cfif get_employee_list.recordcount>
<cfoutput query="get_employee_list">
<cfset phone=ReplaceList(phone_number,list1,list2)>

	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<cfif listlen(session.workstream_selected_company_id) GT 1><td>#company#</td></cfif>
		<td><a href="javascript:list_to_employee('#emp_id#');" title="View details for #replace(name,"'","")#.">#name#</a></td>
		<td>#extension#</td>
		<td><cfif len(phone) EQ 10>
(#left(phone,3)#) #mid(phone,4,3)#-#right(phone,4)#
<cfelseif len(phone) EQ 7>
#left(phone,3)#-#right(phone,4)#
<cfelse>
#phone#
</cfif></td>
		<td>#emp_id#</td>
		<td>#position_ID#</td>


		<td><a href="mailto:#email#">#email#</a></td>
	</tr>
</cfoutput>
<cfelse>
	<tr>
		<td align="center" colspan="7" class="Note">
			There are no employees that match your criteria.
		</td>
	</tr>
</cfif>