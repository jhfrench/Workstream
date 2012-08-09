
<!-- reports/dsp_lost_time_input.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the  input screen for the lost time report

	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->

</cfsilent>
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr bgcolor="##0000ff" class="HeadTextWhite">
		<td  align ="center">Lost Time Report</td>
	</tr>
</table>
<cfform action="index.cfm?fuseaction=Reports.lost_time" method="POST" name="lost_time">
<table border="0" cellpadding="4" cellspacing="0" align="center" width="35%">
	<tr class="subHeadText">
		<td>
			From:
		</td>
		<td>
			<input type="date" name="from_date" id="from_date" min="2011-09-01" max="#dateformat(now()+30, 'yyyy-mm-dd')#"  maxlength="10" required="required" class="span6 date" />
			<!-- Use CF to create validation <cfinput type="datefield" name="from_date" value="" required="Yes" validate="date" message="Please enter a properly formatted from date." size="11"> --->

			&nbsp;&nbsp;&nbsp;&nbsp;

			To:
			<input type="date" name="to_date" id="to_date" min="2011-09-01" max="#dateformat(now()+30, 'yyyy-mm-dd')#"  maxlength="10" required="required" class="span6 date" />
			<!-- Use CF to create validation <cfinput type="datefield" name="to_date" value="" required="Yes" validate="date" message="Please enter a properly formatted to date." size="11"> ---><br />
			</td>
	</tr>

	<tr class="subHeadText">
		<td>
			Name:
		</td>
		<td>

			<cfselect name="emp_id"  required="yes" message="you must select an employee"class="RegText" size="3" style="width:130px" multiple>

				<option value="ALL" selected>All Employees </option>
				<cfoutput query="get_team_select">
					<cfif Emp_ID is not ""><!--- Don't display blanks --->
						<option value="#emp_id#">#lname#, #left(name, 3)#</option>
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
		</td>
	</tr>
</table>
</cfform>
