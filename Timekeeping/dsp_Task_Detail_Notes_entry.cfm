
<!-- Timekeeping/dsp_task_detail_notes_entry.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the notes entry section of the dask details screen.

	||
	Edits:
	$Log$
	||
	Variables:
	||
	END FUSEDOC --->
<cfset variables.go_back_to=DateDiff("d",express_check_date.date_locked,now())-1>
</cfsilent>
<cfoutput>
	<tr bordercolor="##000000">
		<td colspan="4" align="center">
<table cellpadding="2" cellspacing="0" class="SubHeadText#session.workstream_text_size#" width="100%">
				<tr bgcolor="##94C9C9">
					<td colspan="2" class="SubHeadText#session.workstream_text_size#">
						&nbsp;Resolution Entry:
					</td>
				</tr>
				<tr class="SubHeadText#session.workstream_text_size#">
					<td class="SubHeadText#session.workstream_text_size#">
						Date: 
							<select name="date" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText#session.workstream_text_size#">
							<cfloop from="0" to="#variables.go_back_to#" index="ii">
								<option value="#DateFormat(now()-ii,'mm/dd/yy')#">#DateFormat(now()-ii,"mm/dd/yy (ddd)")#</option>
							</cfloop>
							</select>
					</td>	
					<td class="SubHeadText#session.workstream_text_size#">
						Hours: <cfset tabindex=incrementvalue(tabindex)><cfinput type="text" name="hours" required="No" validate="float" message="You must enter hours as a number." size="4" tabindex="#tabindex#" class="RegText#session.workstream_text_size#">
					</td>
				</tr>
				<tr class="SubHeadText#session.workstream_text_size#">
					<td class="SubHeadText#session.workstream_text_size#">
						Notes <!--- <cfset tabindex=incrementvalue(tabindex)><img src="#request.dir_level##application.application_specific_settings.image_dir#check.gif" width="15" height="15" alt="Check spelling for these notes." border="0" onClick="OpenWLWindow('notes');" tabindex="#tabindex#"> --->
					</td>
					<td class="SubHeadText#session.workstream_text_size#">
						Type: <cfset tabindex=incrementvalue(tabindex)><cfselect name="notes_type_id" query="get_note_types" display="notes_type" value="notes_type_id" selected="#notes_type_selected#" tabindex="#tabindex#" class="RegText#session.workstream_text_size#"></cfselect>
					</td>
				</tr>
				<tr class="SubHeadText#session.workstream_text_size#">
					<td colspan="2" valign="top" class="SubHeadText#session.workstream_text_size#">
						<textarea name="notes" wrap="soft" cols="50" rows="#max(entry_rows,3)#" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText#session.workstream_text_size#"></textarea>
					</td>
				</tr>
				<tr class="SubHeadText#session.workstream_text_size#">
					<td align="center" colspan="2" valign="top" class="SubHeadText#session.workstream_text_size#">
						<input type="submit" value="Update" height="8" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText#session.workstream_text_size#">
						<input type="submit" name="to_inbox" value="Submit To Inbox" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText#session.workstream_text_size#"></cfoutput>
					</td>
				</tr>
			</table>
		</td>
	</tr>