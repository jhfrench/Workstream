
<!--Directory/dsp_performance_review_entry_form.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the performance review entry form.
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
		<td class="SelectText">
			Date Reviewed:			
		</td>
		<td class="SelectText">
			<cfinput type="text" name="date_reviewed" size="10" maxlength="10" required="Yes" validate="date" message="Please enter the date this employee was reviewed.  (mm/dd/yy)">
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Review Type:			
		</td>
		<td class="SelectText">
</cfoutput>
			<cfselect name="review_type"
          		size="1"
         		message="Please select the type of review."
          		query="get_review_types"
          		value="review_type_id"
          		display="description"
          		required="Yes"
				class="RegText">
			</cfselect>
<cfoutput>
		</td>
	</tr>
	<tr align="center" bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td class="SelectText">
			Rating:			
		</td>
		<td class="SelectText">
			<cfinput type="text" name="rating" validate="float" size="10" maxlength="10" required="Yes" message="Please enter the rating on this review.">
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
		<td class="SelectText" colspan="2">
			<input type="hidden" name="emp_id" value="#emp_id#">
			<input type="submit" value="Submit Review"><input type="button" onclick="javascript:window.close();" value="Cancel">
		</td>
	</tr>
</cfoutput>

