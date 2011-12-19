
<!-- reports/dsp_lost_time_input.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the  input screen for the lost time report

	||
	Edits: 
	$Log$
	Revision 1.1  2005/03/09 18:07:39  stetzer
	<>

	Revision 1.0  2001-11-27 16:04:26-05  long
	created the file

	||
	Variables:
	
	END FUSEDOC --->

</cfsilent>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr bgcolor="##0000ff" class="headText<cfoutput>#session.workstream_text_size#</cfoutput>White">
		<td  align ="center">Lost Time Report</td>
	</tr>
</table>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr class="subheadText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td>
			<cfinclude template="../common_files/dsp_pop_calendar.cfm">		
			<cfmodule template="../common_files/act_calendar.cfm" form_name="lost_time" field_name="from_date,to_date" x_pos="relative">
			<cfform action="index.cfm?fuseaction=lost_time" method="POST" name="lost_time">
			
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
			Name:	
		</td>
		<td>	
		
			<cfselect name="emp_id"  required="yes" message="you must select an employee"class="RegText#session.workstream_text_size#" size="3" style="width:130px" multiple>
		
				<option value="ALL" selected>All Employees </option>
				<cfoutput query="team_select">
					<cfif Emp_ID is not ""><!--- Don't display blanks --->
						<option value="#Emp_ID#">#lname#, #f_init#</option>
					</cfif>
				</cfoutput>
		</cfselect>
		</td>
	</tr>	
	
	<tr>
		<td colspan="3">
			<cfoutput>
				<input type="submit" value="Generate Report" Size="10" style="width:210px">
			</cfoutput>			
		</cfform>
		</td>
	</tr>
</table>
