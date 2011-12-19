
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
Revision 1.1  2006/01/10 22:06:25  stetzer
Added pos num and hris to list

Revision 1.0  2005-02-15 15:46:31-05  daugherty
Initial revision

Revision 1.2  2003-01-08 10:40:21-05  blell
Move extension to the left next to employee name for better name extension match.

Revision 1.1  2001-10-11 10:56:12-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
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

