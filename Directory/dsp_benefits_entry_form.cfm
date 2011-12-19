
<!--Directory/dsp_benefits_entry_form.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the benefits entry form.
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
			Benefit Type:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfselect name="benefit_type"
          		size="1"
         		message="Please select the type of benefit."
          		query="get_benefit_types"
          		value="benefit_type_id"
          		display="description"
          		required="Yes"
				class="RegText#session.workstream_text_size#">
			</cfselect>
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Date Begun:			
		</td>
		<td class="SelectText#session.workstream_text_size#">
			<cfinput type="text" name="date_start" size="10" maxlength="10" required="Yes" validate="date" message="Please enter the date this benefit coverage began.  (mm/dd/yy)" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			PP Deduction:			
		</td>
		<td class="SelectText#session.workstream_text_size#">

			<cfinput type="text" name="benefit_amount" size="10" maxlength="10" validate="integer" required="Yes" message="Please enter a valid benefit amount." class="RegText#session.workstream_text_size#">

		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#">
			Notes:			
		</td>
		<td class="SelectText#session.workstream_text_size#">

			<textarea cols="25" rows="7" name="note"  class="RegText#session.workstream_text_size#"></textarea>
			
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText#session.workstream_text_size#" colspan="2">
			<input type="hidden" name="emp_id" value="#emp_id#">
			<input type="submit" value="Submit Benefit" class="RegText#session.workstream_text_size#"><input type="button" onclick="javascript:window.close();" value="Cancel" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
</cfoutput>

