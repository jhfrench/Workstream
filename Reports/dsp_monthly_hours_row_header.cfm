
<!--Reports/dsp_monthly_hours_row_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row headers for the billable and non-billable monthly hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfif comparenocase(temp_et,employee_classification)>
<cfset temp_et=employee_classification>
<cfif Emp_type_hours GT 0>
<cfinclude template="dsp_employee_classification_hours.cfm">
</cfif>
	<tr class="SubHeadText">
			<td colspan="2" align="center">
				<cfoutput>#employee_classification#</cfoutput>
			</td>
		</tr>
	<tr class="HeadTextWhite" bgcolor="#0000ff">
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
	