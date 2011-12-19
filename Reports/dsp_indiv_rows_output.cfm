
<!--Reports/dsp_indiv_rows_output.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I output the rows of the individual hours report.

	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
</cfsilent>
<cfoutput query="get_hours">
<cfif day NEQ date> 
<tr>
	<td colspan="4">
		  <hr color="##000000" size="1" class="RegText#session.workstream_text_size#">
	</td>
</tr>
</cfif>
<cfset day=date>
<cfset total_hours=total_hours+hours>
	<!-- see this all the time--->
	<tr valign="top">
		<td class="RegText#session.workstream_text_size#">
			#DateFormat(date, "mm/dd/yy")#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#project_display#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#decimalformat(hours)#
		</td>
		<td class="RegText#session.workstream_text_size#">
			#notes#
		</td>
	</tr>
<cfif get_hours.currentrow EQ get_hours.recordcount>
<!-- only see this after the date changes
<tr>
	<td colspan="4">
		  <hr color="##000000" class="RegText#session.workstream_text_size#">
	</td>
</tr>--->
<tr bgcolor="##c0c0c0">
	<td colspan="4" class="HeadText#session.workstream_text_size#White">
		Total hours between #from_date# and #through_date#: #decimalformat(total_hours)#
	</td>
</tr>
<cfset total_hours=0>
</cfif>
</cfoutput>