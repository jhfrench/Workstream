
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
			<th>Reassign Hours</th>
			<th>Date</th>
			<th>Hours</th>
			<th>Notes</th>
		</td>
	</thead>
	<tbody>
	<cfoutput query="get_time_entry_details">
		<tr>
			<td>
				<cfif billed_ind>Time previouly billed.<cfelse><cfinput type="checkbox" name="notes_id" value="#notes_id#" required="yes" message="Please mark which hours you wish to reassign."></cfif>
			</td>
			<td scope="row" class="date">
				<a href="javascript:time_edit('#time_entry_id#');" title="Edit this time entry.">#dateformat(work_date,"m/d/yyyy")#</a>
			</td>
			<td class="number">
				<a href="javascript:time_edit('#time_entry_id#');" title="Edit this time entry.">#decimalformat(hours)#</a>
			</td>
			<td>
				<a href="javascript:time_edit('#time_entry_id#');" title="Edit this time entry.">#replace(paragraphformat(stripcr(note)),"<P>","","all")#</a>
			</td>
		</tr>
	</cfoutput>
	<tbody>
</table>
