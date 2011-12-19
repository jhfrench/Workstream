
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
	Revision 1.1  2005/03/09 18:22:26  stetzer
	<>

	Revision 1.4  2001-12-12 11:00:14-05  long
	added an onchange in javascript to validate the hours field

	Revision 1.3  2001-11-30 14:05:16-05  french
	Displaying customer name.

	Revision 1.2  2001-11-14 12:33:32-05  french
	Changed date drop-down box to be driven by date-locked.

	Revision 1.1  2001-10-11 10:54:59-04  long
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
	<tr align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<cfoutput query="express_check_date">
			<select name="date" tabindex="#variables.tabindex#" class="RegText#session.workstream_text_size#">
			<cfloop from="0" to="#variables.go_back_to#" index="ii">
				<option value="#DateFormat(dateadd("m",1,now())-ii,'mm/dd/yy')#"<cfif NOT datediff("d",now(),dateadd("m",1,now())-ii)> SELECTED</cfif>>#DateFormat(dateadd("m",1,now())-ii,"mm/dd/yy (ddd)")#</option></cfloop>
			</select>
		</cfoutput>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<cfoutput><td align="center" class="RegText#session.workstream_text_size#">
			<input type="text" name="hours" size="4" tabindex="#variables.tabindex#" class="RegText#session.workstream_text_size#" onchange="validate_number(this.value)">
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText#session.workstream_text_size#">
			<select name="project_id" tabindex="#variables.tabindex#" size="1" class="RegText#session.workstream_text_size#"></cfoutput><cfoutput query="get_valid_projects">
				<option value="#project_id#">#display#</option></cfoutput>
			</select>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
		<td align="center" class="RegText<cfoutput>#session.workstream_text_size#">
			<textarea rows="#session.workstream_express_notes_height#" cols="#session.workstream_express_notes_width#" name="notes_#DEX#" tabindex="#variables.tabindex#" wrap="soft" class="RegText#session.workstream_text_size#</cfoutput>"></textarea>
		</td>
<cfset variables.tabindex=incrementvalue(variables.tabindex)>
	</tr>
</cfloop>

