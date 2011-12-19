
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
		<td align="center" class="RegText#session.workstream_text_size#">#theyear#</td>
		<td align="center" class="RegText#session.workstream_text_size#">#thequarter#</td>
		<td align="center" class="RegText#session.workstream_text_size#">#pop#</td>
		<cfloop list="#reasons#" index="ii">
		<cfparam name="dataset#ii#" default="0">
		<td align="center" class="RegText#session.workstream_text_size#">#evaluate("#ii#")#</td>
		<td align="center" class="RegText#session.workstream_text_size#">#decimalformat(evaluate("#ii#")/pop*100)#%</td><cfset "dataset#ii#"=#evaluate("dataset#ii#")#+#evaluate("#ii#")#>
		</cfloop>
	</tr>
</cfoutput>
<cfoutput>
	<tr>
		<td></td>
		<td colspan="2" class="RegText#session.workstream_text_size#Bd">Between #DateFormat(date_start, "mmm/yyyy")# and #DateFormat(dateadd("q", 1, now()), "mmm/yyyy")#:</td>
		<td align="center" class="RegText#session.workstream_text_size#Bd">#Total_population.total_pop#</td>
		<cfloop list="#reasons#" index="ii">
		<td align="center" class="RegText#session.workstream_text_size#Bd">#evaluate("dataset#ii#")#</td>
		<td align="center" class="RegText#session.workstream_text_size#Bd">#decimalformat(evaluate("dataset#ii#")/Total_population.total_pop*100)#%</td>
		</cfloop>
	</tr>
</cfoutput>

