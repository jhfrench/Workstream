
<!--Reports/dsp_turnover_rows.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the table rows/data for the turnover report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfset total_pop=0>
</cfsilent>
<cfoutput query="Get_Numbers">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td></td>
		<td align="center">#theyear#</td>
		<td align="center">#thequarter#</td>
		<td align="center">#pop#</td>
		<cfloop list="#reasons#" index="ii">
		<cfparam name="dataset#ii#" default="0">
		<td align="center">#evaluate("#ii#")#</td>
		<td align="center">#decimalformat(evaluate("#ii#")/pop*100)#%</td><cfset "dataset#ii#"=#evaluate("dataset#ii#")#+#evaluate("#ii#")#>
		</cfloop>
	</tr>
</cfoutput>
<cfoutput>
	<tr>
		<td></td>
		<td colspan="2" class="RegTextBd">Between #dateformat(date_start, "mmm/yyyy")# and #dateformat(dateadd("q", 1, now()), "mmm/yyyy")#:</td>
		<td align="center" class="RegTextBd">#Total_population.total_pop#</td>
		<cfloop list="#reasons#" index="ii">
		<td align="center" class="RegTextBd">#evaluate("dataset#ii#")#</td>
		<td align="center" class="RegTextBd">#decimalformat(evaluate("dataset#ii#")/Total_population.total_pop*100)#%</td>
		</cfloop>
	</tr>
</cfoutput>

