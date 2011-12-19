
<!--Reports/dsp_new_engage_chart.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display new engagements by customer and month.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset temp_year=0>
</cfsilent>
<table align="center" border="0" cellpadding="1" cellspacing="0">
<cfoutput>
	<tr>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Year</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Month</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Customer</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">Projects</td>
	</tr>
</cfoutput>
<cfoutput query="new_engage_output">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"<cfelseif (year_entered MOD 2)> bgcolor="##BAEE9B"</cfif>>
		<td align="right" class="RegText#session.workstream_text_size#">
			<cfif year_entered NEQ temp_year>#year_entered#<cfelse>&nbsp;</cfif>
		</td>
		<td align="left" class="RegText#session.workstream_text_size#">
			#MonthAsString(month_entered)#
		</td>
		<td align="left" class="RegText#session.workstream_text_size#">
			#customer_name#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#numberformat(engagement_count)#
		</td>
		<cfset temp_year=year_entered>
	</tr>
</cfoutput>
</table>

