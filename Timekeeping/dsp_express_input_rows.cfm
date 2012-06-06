
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
<cfset variables.go_back_to=datediff("d",express_check_date.date_locked,dateadd("m",1,now()))-1>
<cfif NOT len(session.workstream_express_input_rows)>
	<cfset session.workstream_express_input_rows=1>
</cfif>
</cfsilent>
<cfloop index="dex" from="1" to="#min(session.workstream_express_input_rows,30)#">
<cfoutput>
	<tr align="center">
		<td align="center">
			<select name="date">
			<cfloop from="0" to="#variables.go_back_to#" index="ii">
				<<option value="#dateformat(dateadd("m",1,now())-ii,'mm/dd/yy')#"<cfif NOT datediff("d",now(),dateadd("m",1,now())-ii)> SELECTED</cfif>>#dateformat(dateadd("m",1,now())-ii,"mm/dd/yy (ddd)")#</option></cfloop>
			</select>
		</td>
</cfoutput>

		<td align="center">
			<input type="number" name="hours" id="hours" step="0.25" min="0" max="24" class="span6">
		</td>

		<td align="center">
			<select name="task_id" size="1">
				<cfoutput query="express_task_list"><cfparam name="request.grouper" default="#grouper#"><cfif compare(request.grouper,"nope") AND request.grouper NEQ grouper><option value="0">*************</option></cfif><option value="#workflow_id#">#task_name#</option><cfset request.grouper=grouper>
				</cfoutput><cfset request.grouper="nope">
			</select>
		</td>

		<td align="center">
			<textarea rows="<cfoutput>#session.workstream_express_notes_height#" cols="#session.workstream_express_notes_width#" name="notes_#DEX#"</cfoutput> wrap="soft"></textarea>
		</td>

	</tr>
</cfloop>
