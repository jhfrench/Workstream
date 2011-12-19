
<!--Reports/dsp_monthly_hours_row_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row headers for the billable and non-billable monthly hours report.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfif comparenocase(temp_et,employee_classification)>
<cfset temp_et=employee_classification>
<cfif Emp_type_hours GT 0>
<cfinclude template="dsp_employee_classification_hours.cfm">
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
	