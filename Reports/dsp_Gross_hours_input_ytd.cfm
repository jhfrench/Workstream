
<!-- Reports/dsp_Gross_hours_Input_ytd.cfm
	Author: Joshua Peters -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the selection criteria for the Gross Hours Year to Date report.
	||
	Name: Joshua Peters
	||
	Edits:

	 || 
	END FUSEDOC --->
</cfsilent>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr bgcolor="##0000ff" class="HeadTextWhite">
		<td align ="center">Gross Hours Report - Breakdown</td>
	</tr>
</table>
<cfform action="index.cfm?fuseaction=Reports.gross_hours_ytd" method="POST" name="gross_hours_ytd">
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr class="subHeadText">
		<td>
			From:
		</td>
		<td>
			<input type="date" name="from_date" id="from_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
		</td>
	</tr>
	<tr class="subHeadText">
		<td>
			To:
		</td>
		<td>
			<input type="date" name="to_date" id="to_date" min="#dateformat(application.application_specific_settings.workstream_start_date, 'yyyy-mm-dd')#" maxlength="10" required="required" class="span3 date" />
		</td>
	</tr>

	<tr class="subHeadText">
		<td>
			Sort By:
		</td>
		<td>
			<select name="sort_by" size="1" style="width:130px">
				<option value="Demographics.last_name" selected="selected">Employees
				<option value="Loc1.city, Demographics.last_name">Location
				<option value="REF_Employee_Classification.employee_classification, Demographics.last_name">Employee Type
			</select>
		</td>
	</tr>

	<tr class="subHeadText">
		<td>
			Name:
		</td>
		<td>
		<cfoutput>
			<select name="display_person" size="3" style="width:130px" multiple="multiple">
		</cfoutput>
				<option value="ALL" selected="selected">All Employees
				<cfoutput query="get_team_select">
					<cfif len(user_account_id)>
						<option value="#user_account_id#">#display#
					</cfif>
				</cfoutput>
		</select>
		</td>
	</tr>

	<tr class="subHeadText">
		<td>
			Office:
		</td>
		<td>
		<cfoutput>
			<select name="display_office" size="3" style="width:130px" multiple="multiple">
				<option value="ALL" selected="selected">All Offices</option>
		</cfoutput>
				<cfoutput query="office_loc">
					<cfif len(office_location)><!--- Don't display blanks --->
						<option value="#Office_location#">#Office_location#</option>
					</cfif>
				</cfoutput>
			</select>
		</td>
	</tr>

	<tr>
		<td colspan="3">
			<cfoutput>
				<input type="submit" onclick="selectAllList('display_person','ALL');" name="submit_criteria" value="Generate Report" Size="10" style="width:210px">
			</cfoutput>
		</td>
	</tr>
</table>
</cfform>
