
<!--Timekeeping/dsp_time_entry_edit_row.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display a page that lets the user edit or delete an existing time entry and its note.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	<-> attributes.referer: string that incidicates which fuseaction to pursue.
	<-- attributes.notes_id: number that corresponds to the identity column of the Notes table
	<-- attributes.time_entry_id: number that corresponds to the identity column of the Time_Entry table, set at pag_time_entry_edit.cfm.
	--> [attributes.given_referer]: string that incidicates which fuseaction to pursue.
	--> request.time_entry_id: number that corresponds to the identity column of the Time_Entry table, set at pag_time_entry_edit.cfm.
	--> time_entry_edit.customer_description: string that identifies the customer for a particular task
	--> time_entry_edit.date: date of when the work was done for a particular task
	--> time_entry_edit.hours: number of hours completed for a particular timekeeping entry
	--> time_entry_edit.note: string, sometimes large, that contains the task description notes
	--> time_entry_edit.notes_id: number that corresponds to the identity column of the Notes table
	--> time_entry_edit.project_description: string that identifies the project for a particular task
	--> time_entry_edit.task_name: string that identifies the task name for a particular task
 --->
<cfif isdefined("attributes.given_referer")>
	<cfset attributes.referer=attributes.given_referer>
<cfelse>
	<cfset attributes.referer="Timekeeping.express_entry">
</cfif>
<cfset variables.go_back_to=DateDiff("d",express_check_date.date_locked,now())-1>
</cfsilent>
<cfoutput query="time_entry_edit">	
	<tr bgcolor="##808080" class="HeadTextWhite">
		<td>
			Customer
		</td>
		<td>
			Project
		</td>
		<cfif variables.entry_type><td>
			Task
		</td></cfif>
	</tr>
	<tr class="RegText">
		<td valign="top">
			#customer_description#
		</td>
		<td valign="top">
			<cfif NOT variables.entry_type>
				<select name="project_id"  size="1" class="RegText">
					<cfloop query="get_valid_projects">
						<option value="#project_id#" <cfif time_entry_edit.project_id eq get_valid_projects.project_id>selected</cfif>>#display#</option>
					</cfloop>
				</select>
			<cfelse>
				#replace(project_description,"#customer_description#-","")#
			</cfif>
		</td>
		<cfif variables.entry_type><td>
			<a href="javascript:note_to_task('#task_id#');" onmouseover="MM_displayStatusMsg('View this task.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText">#task_name#</a>
		</td></cfif>
	</tr>
	<tr bgcolor="##808080" class="HeadTextWhite">
		<td>
			Date
		</td>
		<td>
			Hours Worked
		</td>
		<cfif variables.entry_type><td>
			&nbsp;
		</td></cfif>
	</tr>
	<tr class="RegText">
		<td>
			<cfselect name="date" required="Yes" message="Please enter a valid date for this task." class="RegText">
			<cfloop from="0" to="#variables.go_back_to#" index="variables.date_adjust_ii">
				<cfset variables.temp_date=dateformat(now()-variables.date_adjust_ii,'mm/dd/yy')>
				<option value="#variables.temp_date#"<cfif NOT datediff("d", variables.temp_date, date)> SELECTED</cfif>>#dateformat(now()-variables.date_adjust_ii,"mm/dd/yy (ddd)")#</option>
			</cfloop>
			</cfselect>
		</td>
		<td>
			<cfinput type="text" name="hours" value="#decimalformat(hours)#" required="Yes" validate="float" message="You must enter hours, as a number, for a time keeping entry. If you wish to delete a task, mark the delete checkbox." class="RegText">
		</td>
		<cfif variables.entry_type><td>
			&nbsp;
		</td></cfif>
	</tr>
	<tr bgcolor="##808080" class="HeadTextWhite">
		<td colspan="6">
			Notes
		</td>
	</tr>
	<tr class="RegText">
		<td colspan="6">
			<textarea name="note" cols="100" rows="4" wrap="soft" class="RegText">#stripCR(note)#</textarea>
		</td>
	</tr>
<cfif time_entry_edit.date GT dateformat(now()-variables.go_back_to,'mm/dd/yy')>
	<tr align="left" bgcolor="##990202" class="RegTextWhite">
		<td colspan="6">
		<label for="delete"><input type="checkbox" name="delete" id="delete" value="1" class="RegText">Delete This Record</label>&nbsp;</td>
	</tr>
</cfif>
	<input type="hidden" name="notes_id" value="#notes_id#">
	<input type="hidden" name="referer" value="<cfif variables.entry_type>#attributes.referer#<cfelse>time_entry</cfif>">
	<input type="hidden" name="time_entry_id" value="#request.time_entry_id#">
</cfoutput>

