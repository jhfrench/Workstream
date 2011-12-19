
<!--Reports/dsp_leader_hours.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:07:32  stetzer
<>

Revision 1.1  2001-10-11 11:04:38-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
<cfparam name="blah" default="1">
</cfsilent>
<table border="1" align="center" bordercolor="##000000" cellpadding="1" cellspacing="0">
	<tr bgcolor="##0000ff">
		<td align="center" height="27" colspan="<cfif blah>4<cfelse>2</cfif>" class="headtext<cfoutput>#session.workstream_text_size#</cfoutput>White">Summary of Hours by Client Code &amp; Employee</td>
	</tr>
	<tr bgcolor="#c0c0c0">
		<cfif blah><td align="center" class="Subheadtext<cfoutput>#session.workstream_text_size#</cfoutput>">Name</td>
		<td align="center" class="Subheadtext<cfoutput>#session.workstream_text_size#</cfoutput>">Month</td></cfif>
		<td align="center" class="Subheadtext<cfoutput>#session.workstream_text_size#</cfoutput>">Client Name</td>
		<td align="center" class="Subheadtext<cfoutput>#session.workstream_text_size#</cfoutput>"><cfif blah>Total </cfif>Hours</td>
	</tr>
<cfoutput query="Agg_hours_by_month">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<cfif blah><td align="center" class="Regtext#session.workstream_text_size#">#name#</td>
		<td align="center" class="Regtext#session.workstream_text_size#">#month#/#year#</td></cfif>
		<td align="left" class="Regtext#session.workstream_text_size#">#clientname#</td>
		<td align="right" class="Regtext#session.workstream_text_size#">#DecimalFormat(sumofhours)#</td>
	</tr>
</cfoutput>
</table>
<br>&nbsp;
<br>
<table border="1" align="center" bordercolor="##000000" cellpadding="1" cellspacing="0">
	<tr bgcolor="##0000ff">
		<td align="center" height="27" colspan="3" class="headtext<cfoutput>#session.workstream_text_size#</cfoutput>White">Summary of Hours by Week &amp; Employee</td>
	</tr>
	<tr bgcolor="#c0c0c0">
		<cfif blah><td align="center" class="Subheadtext<cfoutput>#session.workstream_text_size#</cfoutput>">Name</td></cfif>
		<td align="center" class="Subheadtext<cfoutput>#session.workstream_text_size#</cfoutput>">Week</td>
		<td align="center" class="Subheadtext<cfoutput>#session.workstream_text_size#</cfoutput>"><cfif blah>Total </cfif>Hours</td>
	</tr>
<cfoutput query="Agg_hours_by_week">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif>>
		<cfif blah><td align="center" class="Regtext#session.workstream_text_size#">#name#</td></cfif>
		<td align="left" class="Regtext#session.workstream_text_size#"><cfif blah>#month#/#year# </cfif>Week #week#</td>
		<td align="right" class="Regtext#session.workstream_text_size#">#DecimalFormat(sumofhours)#</td>
	</tr>
</cfoutput>
</table>

