
<!--Reports/dsp_employee_classification_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
			<tr class="SubHeadText">
				<td colspan="2" align="right"  >
					Total Hours for Employee Type:
				</td>
				<td>
					<cfoutput>#decimalformat(Emp_Type_Hours)#</cfoutput><cfset Emp_Type_Hours =0>
				</td>
			</tr>
			
