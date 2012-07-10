
<!--Report/dsp_Gross_hours_Input_ytd.cfm
	Author: Joshua Peters  -->
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
		<td  align ="center">Gross Hours Report - Breakdown</td>
	</tr>
</table>
<cfform action="index.cfm?fuseaction=Reports.gross_hours_ytd" method="POST" name="gross_hours_ytd">
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr class="subHeadText">
		<td>
			From:
		</td>
		<td>
			<cfinput type="datefield" name="from_date" value="" required="Yes" validate="date" message="Please enter a properly formatted from date." size="11">
			</td>
	</tr>
	<tr class="subHeadText">
		<td>
			To:
		</td>
		<td>
			<cfinput type="datefield" name="to_date" value="" required="Yes" validate="date" message="Please enter a properly formatted to date." size="11"><br />
			</td>
	</tr>
	
	<tr class="subHeadText">
		<td>
			Sort By:	
		</td>
		<td>
			<select name="sort_by" size="1" style="width:130px">
				<option value="Emp_Contact.lname" selected>Employees
				<option value="Loc1.city, Emp_Contact.lname">Location
				<option value="REF_Employee_Classification.employee_classification, Emp_Contact.lname">Employee Type
			</select>
		</td>
	</tr>		
	
	<tr class="subHeadText">
		<td>
			Name:	
		</td>
		<td>	
		<cfoutput>
			<select name="display_person" size="3" style="width:130px" multiple>
		</cfoutput>
				<option value="ALL" selected>All Employees
				<cfoutput query="team_select">
					<cfif Emp_ID is not ""><!--- Don't display blanks --->
						<option value="#Emp_ID#">#lname#, #f_init#
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
			<select name="display_office" size="3" style="width:130px" multiple>
				<option value="ALL" selected>All Offices</option>
		</cfoutput>			
				<cfoutput query="office_loc">
					<cfif Office_location is not ""><!--- Don't display blanks --->
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
