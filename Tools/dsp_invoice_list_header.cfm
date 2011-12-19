
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
	Revision 1.0  2005/02/15 21:01:18  daugherty
	Initial revision

	Revision 1.1  2001-10-11 13:15:28-04  long
	Added FuseDoc

	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<tr class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
	<td class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		Engagement
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
