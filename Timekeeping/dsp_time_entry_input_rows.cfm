
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
<cfset variables.go_back_to=DateDiff("d",express_check_date.date_locked,dateadd("m",1,now()))-1>
<cfif NOT len(session.workstream_express_input_rows)>
	<cfset session.workstream_express_input_rows=1>
</cfif>
</cfsilent>
<cfloop index="dex" from="1" to="#min(session.workstream_express_input_rows,30)#">
	<tr align="center" class="RegText">
		<td align="center" class="RegText">
		<cfoutput query="express_check_date">
			<select name="date" class="RegText">
			<cfloop from="0" to="#variables.go_back_to#" index="variables.date_adjust_ii">
				<cfset variables.temp_date=dateadd("m",1,now())-variables.date_adjust_ii>
				<option value="#dateformat(variables.temp_date,'mm/dd/yy')#"<cfif NOT datediff("d",now(),variables.temp_date)> SELECTED</cfif>>#dateformat(variables.temp_date,"mm/dd/yy (ddd)")#</option></cfloop>
			</select>
		</cfoutput>
		</td>

		<cfoutput><td align="center" class="RegText">
			<input type="text" name="hours" size="4" class="RegText" onchange="validate_number(this.value)">
		</td>

		<td align="center" class="RegText">
			<select name="project_id" size="1" class="RegText"></cfoutput><cfoutput query="get_valid_projects">
				<option value="#project_id#">#display#</option></cfoutput>
			</select>
		</td>
<cfoutput>
		<td align="center" class="RegText">
			<textarea rows="#session.workstream_express_notes_height#" cols="#session.workstream_express_notes_width#" name="notes_#DEX#" wrap="soft" class="RegText" /></cfoutput>
		</td>
	</tr>
</cfloop>

