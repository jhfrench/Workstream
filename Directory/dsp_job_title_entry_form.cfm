
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
			<cfinput type="text" name="date_start" size="10" maxlength="10" required="yes" validate="date" message="Please enter the date this job title was granted.  (mm/dd/yy)">
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
			<input type="hidden" name="emp_id" value="#emp_id#" />
			<input type="submit" value="Submit Job Title"><input type="button" onclick="javascript:window.close();" value="Cancel">
		</td>
	</tr>
</cfoutput>

