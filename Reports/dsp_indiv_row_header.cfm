
<!--Reports/dsp_indiv_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the row headers for the individual hours report and the manager individual hours report.

	||
	Edits:
	$Log$
	Revision 1.3  2006/05/17 13:47:55  csy
	task43269 I got rid of the <cfoutput>#emp_id#</cfouput> that I put to see the employee id of the employee whose report is being viewed.

	Revision 1.1  2005-03-09 13:07:09-05  stetzer
	<>

	Revision 1.2  2001-12-06 14:35:02-05  french
	Applying style sheet correctly to Reports module. Adding Customers.description to output.

	Revision 1.1  2001-10-11 11:04:38-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td colspan="2" class="SubHeadText#session.workstream_text_size#White">
			Full Name: <cfif IsDefined ("name.lname")>#name.lname#, #name.name#<cfelse>#last_name#, #first_name#</cfif>
		</td>
		<td colspan="2" class="SubHeadText#session.workstream_text_size#White">
			Company: <cfif IsDefined ("name.lname")>#name.company#<cfelse>#company_name#</cfif>
		</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="RegText#session.workstream_text_size#Bd">
			Work&nbsp;Day
		</td>
		<td class="RegText#session.workstream_text_size#Bd">
			Code
		</td>
		<td class="RegText#session.workstream_text_size#Bd">
			Hours
		</td>
		<td class="RegText#session.workstream_text_size#Bd">
			Notes
		</td>
	</tr>
</cfoutput>
		
