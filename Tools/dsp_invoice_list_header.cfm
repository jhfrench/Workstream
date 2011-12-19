
<!--Tools/dsp_invoice_list_header.cfm
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
<tr class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Project
	</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Billing Type
	</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Total Monthly Bill
	</td>
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Current Tasks
	</td>
</tr>
