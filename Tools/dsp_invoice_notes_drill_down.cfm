
<!--Tools/dsp_invoice_notes_drill_down.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the notes for an employee/month/year/project code.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 21:01:19  daugherty
	Initial revision

	Revision 1.0  2002-02-19 14:54:23-05  french
	Creating drill-down to the notes level from the invoice tool.

	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfoutput query="invoice_notes_drill_down">
	<tr valign="top"<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td align="center" class="RegText#session.workstream_text_size#">#dateformat(date,"mm/dd/yy")#</td>
		<td align="right" class="RegText#session.workstream_text_size#">#hours#</td>
		<td class="RegText#session.workstream_text_size#">#note#</td>
	</tr>
</cfoutput>

