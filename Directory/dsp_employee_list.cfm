
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
	--> last_name: string containing the last name of an employee
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
			<th>Work Phone</th>
			<th>Extension</th>
			<th>Email</th>
			<th class="hidden-phone hidden-tablet"><abbr title="Human Resources Identifier">HRID</abbr></th>
			<th class="hidden-phone hidden-tablet">Pos Num</th>
		</tr>
	</thead>
	<tbody>
	<cfoutput query="get_employee_list">
		<tr>
			<cfif listlen(session.workstream_selected_company_id) GT 1><td>#company#</td></cfif>
			<td scope="row"><a href="javascript:list_to_employee('#user_account_id#');" title="View details for #replace(name,"'","")#.">#name#</a></td>
			<td>
				<cfset variables.phone=replacelist(phone_number, variables.list1, variables.list2)>
				<cfif len(variables.phone) EQ 10>
					<cfset variables.phone="#left(variables.phone,3)#.#mid(variables.phone,4,3)#.#right(variables.phone,4)#">
					<a href="tel:#replace(variables.phone, ".", "-", "all")#">#variables.phone#</a>
				<cfelseif len(variables.phone) EQ 7>
					#left(variables.phone,3)#-#right(variables.phone,4)#
				<cfelse>
					#variables.phone#
				</cfif>
			</td>
			<td>#extension#</td>
			<td><a href="mailto:#email#">#email#</a></td>
			<td class="hidden-phone hidden-tablet">#user_account_id#</td>
			<td class="hidden-phone hidden-tablet">#employment_position_id#</td>
		</tr>
	</cfoutput>
	</tbody>
<cfelse>
	<tr>
		<td class="warning">
			There are no employees that match your criteria.
		</td>
	</tr>
</cfif>
</table>