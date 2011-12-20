
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfset variables.go_back_to=DateDiff("d",express_check_date.date_locked,dateadd("m",1,now()))-1>
<cfset variables.tabindex=1>
<cfif NOT len(session.workstream_express_input_rows)>
	<cfset session.workstream_express_input_rows=1>
</cfif>
</cfsilent>
<cfloop index="dex" from="1" to="#min(session.workstream_express_input_rows,30)#">
	<tr align="center" class="RegText">
		<td align="center" class="RegText">
		<cfoutput query="express_check_date">
			<select name="date" tabindex="#variables.tabindex#" class="RegText">
			<cfloop from="0" to="#variables.go_back_to#" index="variables.date_adjust_ii">
				<cfset variables.temp_date=dateadd("m",1,now())-variables.date_adjust_ii>
				<option value="#dateformat(variables.temp_date,'mm/dd/yy')#"<cfif NOT datediff("d",now(),variables.temp_date)> SELECTED</cfif>>#dateformat(variables.temp_date,"mm/dd/yy (ddd)")#</option></cfloop>
			</select>
		</cfoutput>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<cfoutput><td align="center" class="RegText">
			<input type="text" name="hours" size="4" tabindex="#variables.tabindex#" class="RegText" onchange="validate_number(this.value)">
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText">
			<select name="project_id" tabindex="#variables.tabindex#" size="1" class="RegText"></cfoutput><cfoutput query="get_valid_projects">
				<option value="#project_id#">#display#</option></cfoutput>
			</select>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText<cfoutput>#session.workstream_text_size#">
			<textarea rows="#session.workstream_express_notes_height#" cols="#session.workstream_express_notes_width#" name="notes_#DEX#" tabindex="#variables.tabindex#" wrap="soft" class="RegText</cfoutput>"></textarea>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
	</tr>
</cfloop>

