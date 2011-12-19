
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
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr bgcolor="##0000ff" class="headText<cfoutput>#session.workstream_text_size#</cfoutput>White">
		<td  align ="center">Gross Hours Report - Breakdown</td>
	</tr>
</table>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr class="subheadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td>
			<cfinclude template="../common_files/dsp_pop_calendar.cfm">		
			<cfmodule template="../common_files/act_calendar.cfm" form_name="gross_hours_ytd" field_name="from_date,to_date">
			<cfform action="index.cfm?fuseaction=gross_hours_ytd" method="POST" name="gross_hours_ytd">
			
			From:
		</td>
		<td>
			<cfinput type="text" name="from_date" value="" required="Yes" validate="date" message="Please enter a properly formatted from date." size="11" class="RegText#session.workstream_text_size#" onClick="ShowDate(1)">
			
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			To:
			<cfinput type="text" name="to_date" value="" required="Yes" validate="date" message="Please enter a properly formatted to date." size="11" class="RegText#session.workstream_text_size#" onClick="ShowDate(2)"><br>
			</td>
	</tr>
	
	<tr class="subheadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td>
			Sort By:	
		</td>
		<td>
		<cfoutput>						
			<select name="sort_by" size="1" class="RegText#session.workstream_text_size#" style="width:130px">
		</cfoutput>			
				<option value="Emp_Contact.LName" selected>Employees
				<option value="Loc1.City, Emp_Contact.LName">Location
				<option value="REF_Employee_Classification.employee_classification, Emp_Contact.LName">Employee Type
			</select>
		</td>
	</tr>		
	
	<tr class="subheadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td>
			Name:	
		</td>
		<td>	
		<cfoutput>
			<select name="display_person" class="RegText#session.workstream_text_size#" size="3" style="width:130px" multiple>
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
			
	<tr class="subheadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td>
			Office:	
		</td>
		<td>
		<cfoutput>
			<select name="display_office" size="3" style="width:130px" multiple class="RegText#session.workstream_text_size#">
				<option value="ALL" selected class="RegText#session.workstream_text_size#">All Offices</option>
		</cfoutput>			
				<cfoutput query="office_loc">
					<cfif Office_location is not ""><!--- Don't display blanks --->
						<option value="#Office_location#" class="RegText#session.workstream_text_size#">#Office_location#</option>
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
		</cfform>
		</td>
	</tr>
</table>
