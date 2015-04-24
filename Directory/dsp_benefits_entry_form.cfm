
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
			<input type="date" name="date_start" id="date_start" min="#application.application_specific_settings.workstream_start_date#" maxlength="10" required="required" class="span3 date" />
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			PP Deduction:
		</td>
		<td class="SelectText">
			<input type="number" name="benefit_amount" id="benefit_amount" step="1" min="0" max="9999999999" required="required" class="span5 number" />
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
			<input type="hidden" name="user_account_id" value="#user_account_id#" />
			<input type="submit" value="Submit Benefit" class="btn btn-primary" />
			<input type="button" onclick="javascript:window.close();" value="Cancel" class="btn" />
		</td>
	</tr>
</cfoutput>

