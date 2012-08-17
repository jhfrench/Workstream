
<!--Reports/dsp_indiv_rows_output.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I output the rows of the individual hours report.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfoutput query="get_hours">
<cfif day NEQ date> 
<tr>
	<td colspan="4">
			<hr color="##000000" size="1">
	</td>
</tr>
</cfif>
<cfset day=date>
<cfset total_hours=total_hours+hours>
	<!-- see this all the time--->
	<tr valign="top">
		<td>
			#dateformat(work_date, "m/d/yyyy")#
		</td>
		<td>
			#project_display#
		</td>
		<td>
			#decimalformat(hours)#
		</td>
		<td>
			#notes#
		</td>
	</tr>
<cfif get_hours.currentrow EQ get_hours.recordcount>
<!-- only see this after the date changes
<tr>
	<td colspan="4">
			<hr color="##000000">
	</td>
</tr>--->
<tr bgcolor="##c0c0c0">
	<td colspan="4" class="HeadTextWhite">
		Total hours between #from_date# and #through_date#: #decimalformat(total_hours)#
	</td>
</tr>
<cfset total_hours=0>
</cfif>
</cfoutput>