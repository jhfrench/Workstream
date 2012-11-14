
<!--Timekeeping/dsp_time_entry_input_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the input boxes for project-based time entry.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
 --->
<cfset variables.go_back_to=datediff("d",get_date_locked.date_locked,dateadd("m",1,now()))-1>
<cfif NOT len(session.workstream_express_input_rows)>
	<cfset session.workstream_express_input_rows=1>
</cfif>
</cfsilent>
<tbody>
<cfoutput>
<cfloop index="dex" from="1" to="#min(session.workstream_express_input_rows,30)#">
	<tr>
		<td>
			<select name="date" class="date">
			<cfloop from="0" to="#variables.go_back_to#" index="variables.date_adjust_ii">
				<cfset variables.temp_date=dateadd("m",1,now())-variables.date_adjust_ii>
				<option value="#dateformat(variables.temp_date,'m/d/yyyy')#"<cfif NOT datediff("d",now(),variables.temp_date)> selected="selected"</cfif>>#dateformat(variables.temp_date,"m/d/yyyy (ddd)")#</option></cfloop>
			</select>
		</td>
		<td>
			<input type="number" name="hours" id="hours" step="0.25" min="0" max="24" class="number span6">
		</td>
		<td>
			<select name="project_id" size="1"><cfloop query="get_valid_projects">
				<option value="#project_id#">#display#</option></cfloop>
			</select>
		</td>
		<td>
			<textarea rows="#session.workstream_express_notes_height#" cols="#session.workstream_express_notes_width#" name="notes_#DEX#" wrap="soft"></textarea>
		</td>
	</tr>
</cfloop>
</cfoutput>
</tbody>
