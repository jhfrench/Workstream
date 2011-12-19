
<!--Reports/pag_report.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the container for the report module home screen, where users choose which report to view.

	||
	Edits:
	$Log$
Revision 1.3  2006/05/22 13:15:12  csy
task 44018 I got rid of url variable "inactive"

Revision 1.2  2006-05-11 16:01:28-04  csy
task44018

Revision 1.1  2005-03-09 13:12:21-05  stetzer
<>

Revision 1.1  2001-10-11 11:04:05-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 
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
		<td class="SubHeadText#session.workstream_text_size#" align="right" bgcolor="##008080"><a href="<cfif custom_ind>#custom_url#<cfelse>index.cfm?fuseaction=#action#</cfif>" class="RepLink#session.workstream_text_size#">#report_name#</a></td>
		<td class="RegText#session.workstream_text_size#">#description#</td>
		</tr>
	</cfoutput>
</table>

