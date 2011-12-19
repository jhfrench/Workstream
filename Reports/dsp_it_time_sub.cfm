
<!--Reports/dsp_it_time_sub.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the Monthly Revenue Report.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:07:29  stetzer
	<>

	Revision 1.1  2001-11-13 20:04:16-05  french
	Adding hours to sub chart.

	Revision 1.0  2001-11-08 10:01:47-05  french
	Creating IT Time report.

	||
	END FUSEDOC --->
</cfsilent>
<table align="left" border="0" cellpadding="2" cellspacing="0">
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td colspan="3" class="SubHeadText#session.workstream_text_size#White">
			IT Time for 
			<select name="admin_month" onchange="javascript:document.it_time.submit();" class="RegText#session.workstream_text_size#">
				<cfloop from="1" to="12" index="ii">
				<option value="#ii#"<cfif attributes.admin_month EQ ii> selected</cfif>>#monthAsString(ii)#</option></cfloop>
			</select>
			<select name="admin_year" onchange="javascript:document.it_time.submit();" class="RegText#session.workstream_text_size#">
				<cfloop from="#lowest_year#" to="#year(now())#" index="ii">
				<option value="#ii#"<cfif attributes.admin_year EQ ii> selected</cfif>>#ii#</option></cfloop>
			</select>
		</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="SubHeadText#session.workstream_text_size#">
			Team member
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			Hours
		</td>
		<td align="center" class="SubHeadText#session.workstream_text_size#">
			%
		</td>
	</tr>
</cfoutput>
<cfoutput query="it_time_sub">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_employee('#emp_id#')" onmouseover="MM_displayStatusMsg('View details for #Replace(name,"'","")# #Replace(lname,"'","")#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#lname#, #name#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(it_hours)#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DecimalFormat(it_time_percent)#
		</td>
	</tr>
</cfoutput>
</table>

