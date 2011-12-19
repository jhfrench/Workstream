
<!--Directory/dsp_supervisor_entry_form.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the supervisor entry form.
	||
	Name: Damon Scott
	||
	Edits:
	$Log:
	||
 --->

</cfsilent>
<cfoutput>
	<tr bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Date Implemented:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfinput type="text" name="date" size="10" maxlength="10" required="Yes" validate="date" message="Please enter the date this employee's supervisor was instated.  (mm/dd/yy)" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Supervisor:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
</cfoutput>
			<cfmodule template="../common_files/dsp_team_select.cfm" element_name="SUPERVISOR_ID" selected_flag="0" message="Please select a supervisor." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
<cfif get_present_supervisor.recordcount>
<cfoutput>
	<tr bgcolor="##78A0EB">
		<td colspan="2" class="SelectText#session.workstream_text_size#">
			<strong>Current Supervisor<cfif get_present_supervisor.recordcount GT 1>s</cfif></strong>
		</td>
	</tr>
	<tr bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Check box to remove		
		</td>
		<td class="SelectText#session.workstream_text_size#">
			Last date as supervisor		
		</td>
	</tr>
</cfoutput>
<cfoutput query="get_present_supervisor">
	<tr bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">			
			<label for="#get_present_supervisor.emp_id#"><cfinput type="Checkbox" name="supervisor_id_list" value="#get_present_supervisor.emp_id#" id="#get_present_supervisor.emp_id#" checked="No">#get_present_supervisor.sup_name#</label>
		</td>
		<td class="SelectText#session.workstream_text_size#">			
			<cfinput type="text" name="end_date_#get_present_supervisor.emp_id#" size="10" maxlength="10" required="No" validate="date" message="Please enter the last date under most recent supervisor.  (mm/dd/yy)" class="RegText#session.workstream_text_size#" value="#dateformat(Now(),'mm/dd/yy')#">
		</td>
		<!--- <td>&nbsp;</td> --->
	</tr>
</cfoutput>
</cfif>
<cfoutput>
	<!--- <cfif get_present_supervisor.recordcount>
		<tr bgcolor="##78A0EB">
			<td class="SelectText#session.workstream_text_size#">
				Last Date Under Most Recent Supervisor:			
			</td>
			<td class="SelectText#session.workstream_text_size#">
				<cfinput type="text" name="end_date" size="10" maxlength="10" required="Yes" validate="date" message="Please enter the last date under most recent supervisor.  (mm/dd/yy)" class="RegText#session.workstream_text_size#" value="#dateformat(Now(),'mm/dd/yy')#">
			</td>
		</tr>
	</cfif> --->
	<tr align="center" bgcolor="##78A0EB">
		<td colspan="2" class="SelectText#session.workstream_text_size#">
			<input type="hidden" name="num_present_supervisors" value="#get_present_supervisor.recordcount#">
			<input type="hidden" name="emp_id" value="#emp_id#">
			<input type="submit" value="Submit Supervisor" class="RegText#session.workstream_text_size#"><input type="button" onclick="javascript:window.close();" value="Cancel" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>

