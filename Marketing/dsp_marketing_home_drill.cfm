
<!--Marketing/dsp_marketing_home_drill.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the display for the marketing home for workstream.
	||
	Name: Adam Stezer
	||
	Edits:
	$Log$
	||
	Variables:
	END FUSEDOC --->
<cfoutput query="get_marketing_home_drill">
	<tr <cfif currentrow MOD 2>bgcolor="##E1E1E1"<cfelse>bgcolor="##BAEE9B"</cfif>>
		<td>#Description#</td>
		<td>#Status#</td>
	</tr>
</cfoutput>

