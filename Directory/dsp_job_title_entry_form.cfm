
<!--directory/dsp_job_title_entry_form.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the job title entry form.
	||
	Name: Damon Scott
	||
	Edits:
$Log: 

 
	||
 --->

</cfsilent>
<cfoutput>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Date Begun:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfinput type="text" name="date_start" size="10" maxlength="10" required="Yes" validate="date" message="Please enter the date this job title was granted.  (mm/dd/yy)" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Title:			
		</td>
		<td class="SelectText#session.workstream_text_size#">

			<cfinput type="text" name="title" size="50" maxlength="50" required="Yes" message="Please enter a job title." class="RegText#session.workstream_text_size#">

		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#" colspan="2">
			<input type="Hidden" name="emp_id" value="#emp_id#">
			<input type="submit" value="Submit Job Title" class="RegText#session.workstream_text_size#"><input type="button" onclick="javascript:window.close();" value="Cancel" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>

