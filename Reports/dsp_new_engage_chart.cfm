
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
		<td align="center" class="SubHeadText">Year</td>
		<td align="center" class="SubHeadText">Month</td>
		<td align="center" class="SubHeadText">Customer</td>
		<td align="center" class="SubHeadText">Projects</td>
	</tr>
</cfoutput>
<cfoutput query="new_engage_output">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"<cfelseif (year_entered MOD 2)> bgcolor="##BAEE9B"</cfif>>
		<td align="right">
			<cfif year_entered NEQ temp_year>#year_entered#<cfelse>&nbsp;</cfif>
		</td>
		<td align="left">
			#MonthAsString(month_entered)#
		</td>
		<td align="left">
			#customer_name#
		</td>
		<td align="right">
			#numberformat(engagement_count)#
		</td>
		<cfset temp_year=year_entered>
	</tr>
</cfoutput>
</table>

