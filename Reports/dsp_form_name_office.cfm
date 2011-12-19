
<!--Reports/dsp_form_name_office.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the code to create a simple form that will allow the gross hours report to sort its results by a specific person of a specific office location.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfform action="index.cfm?fuseaction=Reports.gross_hours" method="POST">
<cfoutput>
 	<tr bgcolor="##5F5F5F">
		<td colspan="#variables.daysinmonth#" valign="middle" class="SubHeadText#session.workstream_text_size#White">
				Office Location:</cfoutput>
					<cfselect name="Office_Location" size="1" message="Please don't leave blank" required="Yes" class="RegText#session.workstream_text_size#">
						<option value="ALL">ALL</option><cfoutput query="office_loc">
						<option value ="#Office_location#">#Office_location#</option></cfoutput>
					</cfselect>
					Name:
			<cfselect name="emp_id" size="1" message="Please don't leave blank" required="Yes" class="RegText#session.workstream_text_size#"> 
							<option value="ALL">ALL</option>
						<cfoutput query="team_select">
							<option value="#emp_id#">#lname#, #name#</option>
						</cfoutput>
						</cfselect>
			<cfoutput><input type="submit" value="Submit" align="middle" class="RegText#session.workstream_text_size#">
			<input type="hidden" name="Flag1" value="true">
			<input type="hidden" name="Flag2" value="true">
			<input type="hidden" name="month" value="#month#">
			<input type="hidden" name="year" value="#year#">
		</td></cfoutput>
	</tr>
</cfform>

