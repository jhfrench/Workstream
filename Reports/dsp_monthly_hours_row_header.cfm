
<!--Reports/dsp_monthly_hours_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row headers for the billable and non-billable monthly hours report.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:08:04  stetzer
<>

Revision 1.1  2001-10-11 11:04:36-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfif comparenocase(temp_et,employee_classification)>
<cfset temp_et=employee_classification>
<cfif Emp_type_hours GT 0>
<cfinclude template="Dsp_employee_classification_hours.cfm">
</cfif>
	<tr class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<td colspan="2" align="center">
				<cfoutput>#employee_classification#</cfoutput>
			</td>
		</tr>
	<tr class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>White" bgcolor="#0000ff">
			<td nowrap>
				Customer:
			</td>
			<td>
				Name:
			</td>
			<td>
				Hours:
			</td>
		</tr>
</cfif>	
	