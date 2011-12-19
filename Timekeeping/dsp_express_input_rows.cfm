
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
	Revision 1.1  2005/03/09 18:20:59  stetzer
	<>

	Revision 1.2  2001-11-08 10:38:15-05  french
	Added code to enforce date locked.

	Revision 1.1  2001-10-11 10:55:12-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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
<cfoutput>
	<tr align="center" class="RegText#session.workstream_text_size#">
		<td align="center" class="RegText#session.workstream_text_size#">
			<select name="date" tabindex="#variables.tabindex#" class="RegText#session.workstream_text_size#">
			<cfloop from="0" to="#variables.go_back_to#" index="ii">
				<<option value="#DateFormat(dateadd("m",1,now())-ii,'mm/dd/yy')#"<cfif NOT datediff("d",now(),dateadd("m",1,now())-ii)> SELECTED</cfif>>#DateFormat(dateadd("m",1,now())-ii,"mm/dd/yy (ddd)")#</option></cfloop>
			</select>
		</td>
</cfoutput>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<input type="text" name="hours" size="4" tabindex="<cfoutput>#variables.tabindex#</cfoutput>" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<select name="task_id" tabindex="<cfoutput>#variables.tabindex#</cfoutput>" size="1" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
				<cfoutput query="express_task_list"><cfparam name="request.grouper" default="#grouper#"><cfif compare(request.grouper,"nope") AND request.grouper NEQ grouper><option value="0">*************</option></cfif><option value="#workflow_id#">#task_name#</option><cfset request.grouper=grouper>
				</cfoutput><cfset request.grouper="nope">
			</select>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<textarea rows="<CFOUTPUT>#session.workstream_express_notes_height#" cols="#session.workstream_express_notes_width#" name="notes_#DEX#" tabindex="#variables.tabindex#</CFOUTPUT>" wrap="soft" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"></textarea>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
	</tr>
</cfloop>
