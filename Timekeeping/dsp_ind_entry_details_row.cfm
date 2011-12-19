
<!--Timekeeping/dsp_ind_entry_details_row.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<cfoutput query="get_ind_entry_details">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText#session.workstream_text_size#">
		<td colspan="2">
			&nbsp;
		</td>
		<td valign="top">
			<a href="javascript:time_edit('#time_entry_id#');" onmouseover="MM_displayStatusMsg('Edit this time entry.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#dateformat(date,"mm/dd/yy")#</a>
		</td>
		<td align="right" valign="top">
			<a href="javascript:time_edit('#time_entry_id#');" onmouseover="MM_displayStatusMsg('Edit this time entry.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#decimalformat(hours)#</a>
		</td>
		<td valign="top">
			<a href="javascript:time_edit('#time_entry_id#');" onmouseover="MM_displayStatusMsg('Edit this time entry.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#Replace(ParagraphFormat(StripCR(note)),"<P>","","all")#</a>
		</td>
		<td align="center" valign="top">
			<cfif date LTE express_check_date.date_locked>Time previouly billed.<cfelse><cfinput type="Checkbox" name="notes_id" value="#notes_id#" required="Yes" message="Please mark which hours you wish to reassign." class="RegText#session.workstream_text_size#"></cfif>
		</td>
	</tr>
</cfoutput>