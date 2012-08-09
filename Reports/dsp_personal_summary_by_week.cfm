
<!--Reports/dsp_personal_summary_by_week.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project and week.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<table border="0" cellpadding="2" cellspacing="0">
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td colspan="3" class="SubHeadTextWhite">
			Summary of Hours by Week &amp; Employee
		</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="RegTextBd">Week</td>
		<td class="RegTextBd"><cfif variables.show_details_ind>Total </cfif>Hours</td>
	</tr>
</cfoutput>
<cfoutput query="Agg_hours_by_week">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td><cfif variables.show_details_ind>#month#/#year# </cfif>Week #week#</td>
		<td align="right">#decimalformat(sumofhours)#</td>
	</tr>
</cfoutput>
<cfif NOT variables.show_details_ind>
	<tr>
		<td>
			<cfinclude template="dsp_personal_summary_by_week_graph.cfm">
		</td>
	</tr>
</cfif>
<cfform name="personal_summary" action="" method="POST">
<cfoutput>
	<tr>
		<td align="right" valign="bottom">
			<br />
			Look at time for
			<select name="month">
			<cfloop from="1" to="12" index="month_ii">
				<option value="#month_ii#"<cfif attributes.month EQ month_ii> SELECTED</cfif>>#monthasstring(month_ii)#</option>
			</cfloop>
			</select>
			<select name="year">
				<cfloop from="1999" to="#year(now())#" index="ii">
				<option value="#ii#"<cfif attributes.year EQ ii> SELECTED</cfif>>#ii#</option>
				</cfloop>
			</select>
			<input type="hidden" name="emp_id" value="#attributes.emp_id#" />
			<input type="submit" value="change date" class="btn btn-primary" />
		</td>
	</tr>
</cfoutput>
</cfform>
</table>

