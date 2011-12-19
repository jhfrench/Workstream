
<!--Reports/dsp_leader_report_select.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	Revision 1.2  2005/09/08 22:13:09  french
	Added month/year drop downs to Leadership Hours Report and Personal Hours Summary. Task 35598

	Revision 1.1  2005-03-09 13:07:34-05  stetzer
	<>
	
	Revision 1.1  2001-10-11 11:04:38-04  long
	added $log $ for edits.  To all CFM files that have fusedocs.

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