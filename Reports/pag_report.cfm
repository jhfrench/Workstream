
<!--Reports/pag_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the report module home screen, where users choose which report to view.

	||
	Edits:
	$Log$
	||
	Variables:
	+++template="Qry_object_access.cfm"
	END FUSEDOC --->

<cfinclude template="qry_object_access.cfm">
<cfinclude template="qry_overtime_employees.cfm">
</cfsilent>
<table border="0" cellpadding="4" cellspacing="0" bordercolor="##000000" align="center" width="95%">
	<cfoutput query="get_objects">
		<tr>
		<td class="SubHeadText" align="right" bgcolor="##008080"><a href="<cfif custom_ind>#custom_url#<cfelse>index.cfm?fuseaction=#action#</cfif>" class="RegTextWhite">#report_name#</a></td>
		<td class="RegText">#description#</td>
		</tr>
	</cfoutput>
</table>

