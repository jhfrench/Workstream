
<!--Reports/dsp_gross_hours_row_header_ytd.cfm
	Author: Joshua Peters  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the table rowheaders for the Gross Hours YTD report.
	||
	Name: Joshua Peters
	||
	Edits:
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
	<tr class="HeadText<cfoutput>#session.workstream_text_size#</cfoutput>White" bgcolor="#008080">
		<td>
			Employee 
		</td>
		<td>
			Employee Type 
		</td>
		<td>
			Location 
		</td>	
		<td>
			Non-Billable Hours
		</td>
		<td>
			Billable Hours 
		</td>		

		<td>
			Total Hours
		</td>
	</tr>