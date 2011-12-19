
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

