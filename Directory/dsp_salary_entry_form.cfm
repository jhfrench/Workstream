
<!--Directory/dsp_salary_entry_form.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the salary entry form.
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
			Date Implemented:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfinput type="text" name="date" size="10" maxlength="10" required="Yes" validate="date" message="Please enter the date this employee's salary was instated.  (mm/dd/yy)" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Salary:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfinput type="text" name="salary" size="10" maxlength="10" required="Yes" validate="integer" message="Please enter this employee's salary amount." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Salary Change Type:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
</cfoutput>
			<cfselect name="salary_change_type"
          		size="1"
         		message="Please select the type of salary change."
          		query="get_salary_change_types"
          		value="salary_change_type_id"
          		display="description"
          		required="Yes"
				class="RegText#session.workstream_text_size#">
			</cfselect>
<cfoutput>
		</td>
	</tr>
	<!--- <tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Amount Increase:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfinput type="text" name="salary_increase_amount" size="10" maxlength="10" required="Yes" validate="integer" message="Please enter this employee's salary increase amount." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			% Increase:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfinput type="text" name="salary_percent_increase" size="10" maxlength="10" required="Yes" validate="integer" message="Please enter this employee's percent salary increase." class="RegText#session.workstream_text_size#">
		</td>
	</tr> --->
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#" colspan="2">
			<input type="Hidden" name="emp_id" value="#emp_id#">
			<input type="submit" value="Submit Salary" class="RegText#session.workstream_text_size#"><input type="button" onclick="javascript:window.close();" value="Cancel" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>

