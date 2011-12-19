
<!--Reports/dsp_indiv_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the row headers for the individual hours report and the manager individual hours report.

	||
	Edits:
	$Log$
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
		
