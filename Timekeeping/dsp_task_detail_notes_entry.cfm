
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
<table cellpadding="2" cellspacing="0" class="SubHeadText" width="100%">
				<tr bgcolor="##94C9C9">
					<td colspan="2" class="SubHeadText">
						&nbsp;Resolution Entry:
					</td>
				</tr>
				<tr class="SubHeadText">
					<td class="SubHeadText" nowrap="1">
						Hours: <cfset tabindex=incrementvalue(tabindex)><cfinput type="text" name="hours" required="No" validate="float" message="You must enter hours as a number." size="4" tabindex="#tabindex#" class="RegText">
					</td>	
					<td class="SubHeadText">
						Type: <cfset tabindex=incrementvalue(tabindex)><cfselect name="notes_type_id" query="get_note_types" display="notes_type" value="notes_type_id" selected="#notes_type_selected#" tabindex="#tabindex#" class="RegText"></cfselect>
					</td>
				</tr>
				<tr class="SubHeadText">
					<td class="SubHeadText">
						Notes <!--- <cfset tabindex=incrementvalue(tabindex)><img src="#request.dir_level##application.application_specific_settings.image_dir#check.gif" width="15" height="15" alt="Check spelling for these notes." border="0" onclick="OpenWLWindow('notes');" tabindex="#tabindex#"> --->
					</td>
					<td class="SubHeadText" nowrap="1">
						Date: 
						<select name="date" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText">
						<cfloop from="0" to="#variables.go_back_to#" index="variables.date_adjust_ii">
							<cfset variables.temp_date=now()-variables.date_adjust_ii>
							<option value="#dateformat(variables.temp_date, 'mm/dd/yy')#">#dateformat(variables.temp_date,"mm/dd/yy (ddd)")#</option>
						</cfloop>
						</select>
					</td>
				</tr>
				<tr class="SubHeadText">
					<td colspan="2" valign="top" class="SubHeadText">
						<textarea name="notes" wrap="soft" cols="42" rows="#max(entry_rows,3)#" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText"></textarea>
					</td>
				</tr>
				<tr class="SubHeadText">
					<td align="center" colspan="2" valign="top" class="SubHeadText">
						<input type="submit" value="Update" height="8" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText">
						<input type="submit" name="to_inbox" value="Submit To Inbox" tabindex="<cfset tabindex=incrementvalue(tabindex)>#tabindex#" class="RegText"></cfoutput>
					</td>
				</tr>
			</table>
		</td>
	</tr>