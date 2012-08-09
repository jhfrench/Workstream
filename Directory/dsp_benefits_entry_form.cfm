
<!--Directory/dsp_benefits_entry_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the benefits entry form.
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
			Benefit Type:
		</td>
		<td class="SelectText">
			<cfselect name="benefit_type"
          		size="1"
         		message="Please select the type of benefit."
          		query="get_benefit_types"
          		value="benefit_type_id"
          		display="description"
          		required="yes"
				class="RegText">
			</cfselect>
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Date Begun:
		</td>
		<td class="SelectText">
			<cfinput type="text" name="date_start" size="10" maxlength="10" required="yes" validate="date" message="Please enter the date this benefit coverage began.  (mm/dd/yy)">
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			PP Deduction:
		</td>
		<td class="SelectText">

			<cfinput type="text" name="benefit_amount" size="10" maxlength="10" validate="integer" required="yes" message="Please enter a valid benefit amount.">

		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Notes:
		</td>
		<td class="SelectText">

			<textarea cols="25" rows="7" name="note" ></textarea>

		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td colspan="2" class="btn-group">
			<input type="hidden" name="emp_id" value="#emp_id#" />
			<input type="submit" value="Submit Benefit" />
			<input type="button" onclick="javascript:window.close();" value="Cancel" />
		</td>
	</tr>
</cfoutput>

