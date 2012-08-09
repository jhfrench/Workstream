
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
	END FUSEDOC --->
</cfsilent>
<cfoutput>
 	<tr bgcolor="##5F5F5F">
		<td colspan="#variables.daysinmonth+3#" valign="middle" class="SubHeadTextWhite">
		<cfform action="index.cfm?fuseaction=Reports.gross_hours" method="POST">
			Office Location:
			<cfselect name="Office_Location" size="1" message="Please don't leave blank" required="Yes">
				<option value="ALL">ALL</option><cfloop query="office_loc">
				<option value ="#Office_location#">#Office_location#</option></cfloop>
			</cfselect>
			Name:
			<cfselect name="emp_id" size="1" message="Please don't leave blank" required="Yes"> 
				<option value="ALL">ALL</option><cfloop query="get_team_select">
				<option value="#emp_id#">#lname#, #name#</option></cfloop>
			</cfselect>
			<input type="hidden" name="month" value="#month#" />
			<input type="hidden" name="year" value="#year#" />
			<input type="submit" value="Submit" align="middle" />
		</cfform>
		</td>
	</tr>
</cfoutput>