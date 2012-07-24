
<!--Timekeeping/dsp_ind_entry_details_header.cfm
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
<table class="table table-striped table-bordered">
	<caption><h3>Time Entries</h3></caption>
	<thead>
		<tr>
			<th>Date</th>
			<th>Hours</th>
			<th>Notes</th>
			<th>Reassign Hours</th>
		</td>
	</thead>
	<tbody>
	<cfoutput query="get_ind_entry_details">
		<tr>
			<td class="date">
				<a href="javascript:time_edit('#time_entry_id#');"  title="Edit this time entry.">#dateformat(date,"mm/dd/yy")#</a>
			</td>
			<td class="number">
				<a href="javascript:time_edit('#time_entry_id#');"  title="Edit this time entry.">#decimalformat(hours)#</a>
			</td>
			<td>
				<a href="javascript:time_edit('#time_entry_id#');"  title="Edit this time entry.">#Replace(ParagraphFormat(StripCR(note)),"<P>","","all")#</a>
			</td>
			<td>
				<cfif date LTE express_check_date.date_locked>Time previouly billed.<cfelse><cfinput type="checkbox" name="notes_id" value="#notes_id#" required="Yes" message="Please mark which hours you wish to reassign."></cfif>
			</td>
		</tr>
	</cfoutput>
	<tbody>
</table>
