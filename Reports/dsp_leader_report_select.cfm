
<!--Reports/dsp_leader_report_select.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr>
	<td align="center" colspan="4" class="HeadText#session.workstream_text_size#">
		<cfmodule template="../common_files/dsp_team_select.cfm" onchange=""  class="RegText#session.workstream_text_size#" emp_id="">
		<select name="month" class="RegText#session.workstream_text_size#">
			<cfloop from="1" to="12" index="ii">
			<option value="#ii#"<cfif DatePart("m",(dateadd("m",-1,now()))) EQ ii> SELECTED</cfif>>#ii#</option>
			</cfloop>
		</select>
		<select name="year" class="RegText#session.workstream_text_size#">
			<cfloop from="1999" to="#year(now())#" index="ii">
			<option value="#ii#"<cfif DatePart("yyyy",(dateadd("m",-1, now()))) EQ ii> selected</cfif>>#ii#</option>
			</cfloop>
		</select>
	</td>
</tr>
<tr>
	<td align="center">
		<input type="submit" value="Review Employee's Hours" class="RegText#session.workstream_text_size#">
	</td>		
</tr>
</cfoutput>