
<!--Customers/dsp_open_tasks_row_header.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the column labels for the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:45:54  daugherty
	Initial revision


 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr bgcolor="##c0c0c0" class="SubHeadText#session.workstream_text_size#">
		<td class="SubHeadText#session.workstream_text_size#">
			Due
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			ID
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Time
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Owner
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Name
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Engagement
		</td>
		<td class="SubHeadText#session.workstream_text_size#">
			Status
		</td>
	</tr>
</cfoutput>
