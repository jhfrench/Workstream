
<!--Reports/dsp_employee_classification_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:06:08  stetzer
<>

Revision 1.1  2001-10-11 11:04:45-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
			<tr class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
				<td colspan="2" align="right"  >
					Total Hours for Employee Type:
				</td>
				<td>
					<cfoutput>#DecimalFormat(Emp_Type_Hours)#</cfoutput><cfset Emp_Type_Hours =0>
				</td>
			</tr>
			
