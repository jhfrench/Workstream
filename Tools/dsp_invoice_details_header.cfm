
<!--Tools/dsp_invoice_details_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column headers for the invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr align="center" class="SubHeadText#session.workstream_text_size#White">
	<td align="center" bgcolor="##9A588A" colspan="8" class="SubHeadText#session.workstream_text_size#White">
		&nbsp;#invoice_details.project_name#
	</td>
</tr>
<tr align="center" class="SubHeadText#session.workstream_text_size#">
	<td align="center" class="SubHeadText#session.workstream_text_size#">
		Month/Year
	</td>
	<td align="center" class="SubHeadText#session.workstream_text_size#">
		Project Code
	</td>
	<td align="center" class="SubHeadText#session.workstream_text_size#">
		Name
	</td>
	<td align="center" class="SubHeadText#session.workstream_text_size#">
		Pin
	</td>
	<td align="center" class="SubHeadText#session.workstream_text_size#">
		Rate<span class="RegText#session.workstream_text_size#"> (per hour)</span>
	</td>
	<td align="center" class="SubHeadText#session.workstream_text_size#">
		Hours
	</td>
	<td align="center" class="SubHeadText#session.workstream_text_size#">
		Bill
	</td>
</tr>
</cfoutput>
