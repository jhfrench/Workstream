
<!--Directory/dsp_employee_list.cfm
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
	--> user_account_id: id that identifies user to workstream
	--> extension: string containing the extension of an employee
	--> lname: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> phone_number: string containing the work phone number of an employee
 --->
</cfsilent>
<table class="table table-striped table-bordered table-condensed">
	<caption><h2>Employee Directory</h2></caption>
<cfif get_employee_list.recordcount>
	<thead>
		<tr>
			<cfif listlen(session.workstream_selected_company_id) GT 1><th>Company</th></cfif>
			<th>Name</th>
			<th>Extension</th>
			<th>Work Phone</th>
			<th>HRID</th>
			<th>Pos Num</th>
			<th>Email</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_employee_list">
		<tr>
			<cfif listlen(session.workstream_selected_company_id) GT 1><td>#company#</td></cfif>
			<td><a href="javascript:list_to_employee('#user_account_id#');" title="View details for #replace(name,"'","")#.">#name#</a></td>
			<td>#extension#</td>
			<td>
				<cfset variables.phone=ReplaceList(phone_number,list1,list2)>
				<cfif len(variables.phone) EQ 10>
					(#left(variables.phone,3)#) #mid(variables.phone,4,3)#-#right(variables.phone,4)#
				<cfelseif len(phone) EQ 7>
					#left(variables.phone,3)#-#right(variables.phone,4)#
				<cfelse>
					#variables.phone#
				</cfif>
			</td>
			<td>#user_account_id#</td>
			<td>#position_id#</td>
			<td><a href="mailto:#email#">#email#</a></td>
		</tr>
	</cfoutput>
	</tbody>
<cfelse>
	<tr>
		<td>
			There are no employees that match your criteria.
		</td>
	</tr>
</cfif>
</table>