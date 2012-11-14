
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
<cfloop index="dex" from="1" to="#min(variables.workstream_express_input_rows,30)#">
	<tr>
		<td>
			<input type="date" name="date" id="date" min="#variables.min_date#" max="#variables.max_date#" value="" maxlength="10" class="span8 date" />
		</td>
		<td>
			<input type="number" name="hours" id="hours" step="0.25" min="0" max="24" class="number span6">
		</td>
		<td>
			<select name="task_id" size="1" class="span10">
				<cfloop query="get_express_task_list"><cfparam name="request.sort_order" default="#sort_order#"><cfif compare(request.sort_order,"nope") AND request.sort_order NEQ sort_order><option value="0">*************</option></cfif><option value="#task_id#">#task_name#</option><cfset request.sort_order=sort_order>
				</cfloop><cfset request.sort_order="nope">
			</select>
		</td>
		<td>
			<textarea rows="#variables.workstream_express_notes_height#" cols="#variables.workstream_express_notes_width#" name="notes_#DEX#" wrap="soft" class="span12"></textarea>
		</td>
	</tr>
</cfloop>
</tbody>
</cfoutput>
