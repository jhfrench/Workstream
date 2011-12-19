
<!--Reports/dsp_personal_summary_by_code.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the a month's hours aggregated by project.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:08:36  stetzer
	<>

	||
	END FUSEDOC --->
</cfsilent>
<table border="0" cellpadding="2" cellspacing="0">
<cfoutput>
	<tr bgcolor="##5F5F5F">
		<td colspan="<cfif blah>3<cfelse>2</cfif>" class="SubHeadText#session.workstream_text_size#White">
			Summary of Hours by Client Code &amp; Employee
		</td>
	</tr>
	<tr bgcolor="##c0c0c0">
		<td class="RegText#session.workstream_text_size#Bd">Client Name</td>
		<td class="RegText#session.workstream_text_size#Bd"><cfif blah>Total </cfif>Hours</td>
	</tr>
</cfoutput>
<cfoutput query="Agg_hours_by_month">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<td align="left" class="RegText#session.workstream_text_size#">#clientname#</td>
		<td align="right" class="RegText#session.workstream_text_size#">#DecimalFormat(sumofhours)#</td>
	</tr>
</cfoutput>
</table>

