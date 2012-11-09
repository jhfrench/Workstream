
<!--Directory/dsp_job_title_entry_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the job title entry form.
	||
	Name: Jeromy French
	||
	Edits:
$Log: 

 
	 || 
 --->

</cfsilent>
<cfoutput>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Date Begun:
		</td>
		<td class="SelectText">
			<input type="date" name="date_start" id="date_start" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Title:
		</td>
		<td class="SelectText">

			<cfinput type="text" name="title" size="50" maxlength="50" required="yes" message="Please enter a job title.">

		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td colspan="2"class="btn-group">
			<input type="hidden" name="user_account_id" value="#user_account_id#" />
			<input type="submit" value="Submit Job Title"><input type="button" onclick="javascript:window.close();" value="Cancel">
		</td>
	</tr>
</cfoutput>

