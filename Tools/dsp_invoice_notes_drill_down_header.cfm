
<!--Tools/dsp_invoice_notes_drill_down_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the header for the invoice drilldown to the notes level.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 21:01:19  daugherty
	Initial revision

	Revision 1.0  2002-02-19 14:54:24-05  french
	Creating drill-down to the notes level from the invoice tool.

	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bgcolor="##9A588A">
		<td align="center" class="SubHeadText#session.workstream_text_size#White">Date</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#White">Hours</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#White">Notes</td>
	</tr>
</cfoutput>

