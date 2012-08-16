<!-- Administration/dsp_edit_system_note.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_system_note.cfm">
	<responsibilities>
		I display the form for editing message and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/22/2007" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfoutput>
<cfform name="form_system_note_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellspacing="1" cellpadding="4" width="100%" border="0" bgcolor="##cccccc" summary="table head describes the data held in the table within this table">
	<tr bgcolor="##cccccc"><th><strong><cfif attributes.system_note_id EQ 0>ADD NEW<cfelse>EDIT EXISTING</cfif> MESSAGE</strong></th></tr>
	<cfif len(variables.display_message)><tr bgcolor="##eeeeee"><td><ul><li>#variables.display_message#</li></ul></td></tr></cfif>
	<tr bgcolor="##eeeeee">
		<td>
		<table width="100%" cellspacing="0" cellpadding="8" border="0" summary="Table displays notes">
			<tr>
				<td><label for="display_start_date">Display Start Date (m/d/yyyy)</label>: <br />
					<cfif attributes.system_note_id NEQ 0>
						<cfset variables.display_start_date=get_system_note.display_start_date>
					<cfelse>
						<cfset variables.display_start_date=attributes.display_start_date>
					</cfif>
					<input type="date" name="display_start_date" id="display_start_date" value="#dateformat(variables.display_start_date,'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
				</td>
				<td><label for="display_end_date">Display End Date (m/d/yyyy)</label>: <br />
					<cfif attributes.system_note_id NEQ 0>
						<cfset variables.display_end_date=get_system_note.display_end_date>
					<cfelse>
						<cfset variables.display_end_date=attributes.display_end_date>
					</cfif>
					<input type="date" name="display_end_date" id="display_end_date" value="#dateformat(variables.display_end_date,'yyyy-mm-dd')#" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" class="span3 date" />
				</td>
			</tr>
			<tr>
				<td colspan="2"><label for="note_text">System Note Text</label>:
					<br />
					<textarea name="note_text" id="note_text" cols="50" rows="5"><cfif attributes.system_note_id NEQ 0>#trim(get_system_note.note_text)#<cfelse>#attributes.note_text#</cfif></textarea>
				</td>
				<cfif attributes.system_note_id EQ 0>
					<input type="hidden" name="active_ind" value="1" />
				<cfelse>
				<td><span title="Describes the purpose of the radio buttons following">Active?</span>
					<br /><cfinput type="radio" name="active_ind" id="active_ind_yes" value="1" checked="yes"><label for="active_ind_yes">Yes </label>
				 		 <cfinput type="radio" name="active_ind" id="active_ind_no" value="0" ><label for="active_ind_no">No </label>
				</td>
				</cfif>
			</tr>
		</table>
		</td>
	</tr>
	<tr bgcolor="##dddddd">
		<td class="btn-group">
			<input type="hidden" name="created_by" value="#session.user_account_id#" />
			<input type="hidden" name="system_note_id" value="#attributes.system_note_id#" />
			<cfif attributes.system_note_id EQ 0>
				<input type="submit" name="send_system_note" value="Submit System Note" class="btn btn-primary" />
			<cfelse>
				<input type="submit" name="update_system_note" value="Update System Note" class="btn btn-primary" />
			</cfif>
			&nbsp;&nbsp;<input type="button" name="cancel_button" value="Cancel" onclick="javascript:history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput>
