
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
<cfset variables.go_back_to=DateDiff("d",express_check_date.date_locked,dateadd("m",1,now()))-1>
<cfset variables.tabindex=1>
<cfif NOT len(session.workstream_express_input_rows)>
	<cfset session.workstream_express_input_rows=1>
</cfif>
</cfsilent>
<cfloop index="dex" from="1" to="#min(session.workstream_express_input_rows,30)#">
<cfoutput>
	<tr align="center" class="RegText">
		<td align="center" class="RegText">
			<select name="date" tabindex="#variables.tabindex#" class="RegText">
			<cfloop from="0" to="#variables.go_back_to#" index="ii">
				<<option value="#dateformat(dateadd("m",1,now())-ii,'mm/dd/yy')#"<cfif NOT datediff("d",now(),dateadd("m",1,now())-ii)> SELECTED</cfif>>#dateformat(dateadd("m",1,now())-ii,"mm/dd/yy (ddd)")#</option></cfloop>
			</select>
		</td>
</cfoutput>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText">
			<input type="text" name="hours" size="4" tabindex="<cfoutput>#variables.tabindex#</cfoutput>" class="RegText">
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText">
			<select name="task_id" tabindex="<cfoutput>#variables.tabindex#</cfoutput>" size="1" class="RegText">
				<cfoutput query="express_task_list"><cfparam name="request.grouper" default="#grouper#"><cfif compare(request.grouper,"nope") AND request.grouper NEQ grouper><option value="0">*************</option></cfif><option value="#workflow_id#">#task_name#</option><cfset request.grouper=grouper>
				</cfoutput><cfset request.grouper="nope">
			</select>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText">
			<textarea rows="<cfoutput>#session.workstream_express_notes_height#" cols="#session.workstream_express_notes_width#" name="notes_#DEX#" tabindex="#variables.tabindex#</cfoutput>" wrap="soft" class="RegText"></textarea>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
	</tr>
</cfloop>
