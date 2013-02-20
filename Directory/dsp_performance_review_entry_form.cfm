
<!--Directory/dsp_performance_review_entry_form.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the performance review entry form.
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
			Date Reviewed:
		</td>
		<td class="SelectText">
			<input type="date" name="date_reviewed" id="date_reviewed" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Review Type:
		</td>
		<td class="SelectText">
</cfoutput>
			<cfselect name="review_type" size="1" message="Please select the type of review." query="get_review_types" value="review_type_id" display="description" required="yes" class="RegText" />
<cfoutput>
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Rating:
		</td>
		<td class="SelectText">
			<input type="number" name="rating" id="rating" step="1" min="0" max="100" required="required" class="span5" />
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Reviewer:
		</td>
		<td class="SelectText">
			<!--- <cfset attributes.size = 2> --->
			<cfset attributes.selected_flag = 0>
			<cfset attributes.element_name = "reviewer_id">
			<cfset attributes.message = "Please select a reviewer.">
			<cfset attributes.class = "RegText">
			<cfinclude template="../common_files/dsp_team_select.cfm">
		</td>
	</tr>

	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td colspan="2"class="btn-group">
			<input type="hidden" name="user_account_id" value="#user_account_id#" />
			<input type="submit" value="Submit Review" class="btn btn-primary" />
			<input type="button" onclick="javascript:window.close();" value="Cancel" class="btn" />
		</td>
	</tr>
</cfoutput>