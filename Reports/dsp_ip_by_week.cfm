
<!--Reports/dsp_ip_by_week.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display weekly implementation analysis data.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset variables.temp_year=0>
</cfsilent>
<cfoutput query="ip_by_week">
	<tr<cfif currentrow MOD 2> bgcolor="##E1E1E1"</cfif>>
		<td class="RegText"><cfif year_entered NEQ variables.temp_year>#year_entered#
<cfset variables.temp_year=year_entered><cfelse>&nbsp;</cfif></td>
		<td class="RegText">#week_entered#</td>
		<td align="right" class="RegText">#task_count#</td>
		<td align="right" class="RegText">
			#decimalformat(days_to_complete)#
		</td>
	</tr>
</cfoutput>

