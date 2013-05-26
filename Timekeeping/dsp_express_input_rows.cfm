
<!--Timekeeping/dsp_express_input_rows.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the .
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfset variables.min_date=dateformat(get_date_locked.date_locked, "yyyy-mm-dd")>
<cfset variables.max_date=dateformat(dateadd("m", 1, get_date_locked.date_locked))>
<cfset variables.workstream_express_notes_height=session.workstream_express_notes_height>
<cfset variables.workstream_express_notes_width=session.workstream_express_notes_width>
<cfif NOT len(session.workstream_express_input_rows)>
	<cfset variables.workstream_express_input_rows=1>
<cfelse>
	<cfset variables.workstream_express_input_rows=session.workstream_express_input_rows>
</cfif>
</cfsilent>
<cfoutput>
<tbody>
<cfloop from="1" to="#min(variables.workstream_express_input_rows,30)#" index="variables.input_row_ii">
	<tr>
		<td scope="row">
			<input type="date" name="date" id="date" min="#variables.min_date#" max="#variables.max_date#" value="" maxlength="10" class="span8 date" />
		</td>
		<td>
			<input type="number" name="hours" id="hours" step="0.25" min="0" max="24" class="number span6" />
		</td>
		<td>
			<select name="task_id" size="1" class="span9">
				<cfset variables.sort_order=0>
				<cfloop query="get_express_task_list">
					<cfif variables.sort_order NEQ get_express_task_list.sort_order>
						<cfset variables.sort_order=get_express_task_list.sort_order>
						<cfswitch expression="#variables.sort_order#">
							<cfcase value="1">
								<cfset variables.optgroup_label="Your Tasks">
							</cfcase>
							<cfcase value="2">
								</optgroup>
								<cfset variables.optgroup_label="Team Tasks">
							</cfcase>
							<cfcase value="3">
								</optgroup>
								<cfset variables.optgroup_label="General Billing Codes">
							</cfcase>
							<cfdefaultcase>
								</optgroup>
								<cfset variables.optgroup_label="Undefined Grouping">
							</cfdefaultcase>
						</cfswitch>
						<optgroup label="#variables.optgroup_label#">
					</cfif>
					<option value="#task_id#">#task_name#</option>
				</cfloop>
				</optgroup>
			</select>
		</td>
		<td>
			<textarea rows="#variables.workstream_express_notes_height#" cols="#variables.workstream_express_notes_width#" name="notes_#variables.input_row_ii#" wrap="soft" class="span12"></textarea>
		</td>
	</tr>
</cfloop>
</tbody>
</cfoutput>
