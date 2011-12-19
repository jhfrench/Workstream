
<!--Directory/dsp_employee_list_header.cfm
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	--> company: id that identifies the user's company
	--> email: string containing the email address of an employee
	--> emp_id: id that identifies user to workstream
	--> extension: string containing the extension of an employee
	--> lname: string containing the last name of an employee
	--> name: string containing the first name of an employee
	--> phone_number: string containing the work phone number of an employee
 --->
</cfsilent>
<cfoutput>
	<tr class="SubHeadText#session.workstream_text_size#">
		<cfif listlen(session.workstream_company_select_list) GT 1><td class="SubHeadText#session.workstream_text_size#">Company</td></cfif>
		<td class="SubHeadText#session.workstream_text_size#">Name</td>
		<td class="SubHeadText#session.workstream_text_size#">Extension</td>
		<td class="SubHeadText#session.workstream_text_size#">Work Phone</td>
		<td class="SubHeadText#session.workstream_text_size#">HRID</td>	
		<td class="SubHeadText#session.workstream_text_size#">Pos Num</td>	
		<td class="SubHeadText#session.workstream_text_size#">Email</td>
	</tr>
</cfoutput>

