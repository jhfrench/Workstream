
<!--Reports/dsp_ip_by_week_header.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the efficiency report for the engagement that corresponds to what the user requests (as determined by the fuseaction).
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2005/03/09 18:07:19  stetzer
	<>

	Revision 1.0  2001-12-07 13:58:42-05  french
	Creating Implementation Analysis Report

	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
<tr bgcolor="##c0c0c0" valign="bottom">
	<td class="RegText#session.workstream_text_size#Bd">Year</td>
	<td class="RegText#session.workstream_text_size#Bd">Week</td>
	<td align="center" class="RegText#session.workstream_text_size#Bd" width="40">IP<br>count</td>
	<td align="center" class="RegText#session.workstream_text_size#Bd" width="40">Avg&nbsp;days<br>to&nbsp;complete</td>
</tr>
</cfoutput>

