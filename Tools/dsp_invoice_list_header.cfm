
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
<cfoutput>
<tr class="SubHeadText#session.workstream_text_size#">
	<td class="SubHeadText#session.workstream_text_size#">
		Project
	</td>
	<td class="SubHeadText#session.workstream_text_size#">
		Billing Type
	</td>
	<td class="SubHeadText#session.workstream_text_size#">
		Total Monthly Bill
	</td>
	<td class="SubHeadText#session.workstream_text_size#">
		Current Tasks
	</td>
</tr>
</cfoutput>