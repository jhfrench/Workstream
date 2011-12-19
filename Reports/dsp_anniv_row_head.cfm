
<!--Reports/dsp_anniv_row_head.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the row haeders for the anniversary report.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##c0c0c0">
		<td class="RegText#session.workstream_text_size#Bd">Last Name</td>
		<td class="RegText#session.workstream_text_size#Bd">First Name</td>
		<td class="RegText#session.workstream_text_size#Bd">Date of Hire</td>
		<td class="RegText#session.workstream_text_size#Bd">Tenure (years)</td>
		<td class="RegText#session.workstream_text_size#Bd">Birthday</td>
	</tr>
</cfoutput>

