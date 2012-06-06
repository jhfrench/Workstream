
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
 --->
</cfsilent>
<cfoutput query="get_ind_entry_details">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td colspan="2">
			&nbsp;
		</td>
		<td valign="top">
			<a href="javascript:time_edit('#time_entry_id#');"  title="Edit this time entry.">#dateformat(date,"mm/dd/yy")#</a>
		</td>
		<td align="right" valign="top">
			<a href="javascript:time_edit('#time_entry_id#');"  title="Edit this time entry.">#decimalformat(hours)#</a>
		</td>
		<td valign="top">
			<a href="javascript:time_edit('#time_entry_id#');"  title="Edit this time entry.">#Replace(ParagraphFormat(StripCR(note)),"<P>","","all")#</a>
		</td>
		<td align="center" valign="top">
			<cfif date LTE express_check_date.date_locked>Time previouly billed.<cfelse><cfinput type="Checkbox" name="notes_id" value="#notes_id#" required="Yes" message="Please mark which hours you wish to reassign."></cfif>
		</td>
	</tr>
</cfoutput>