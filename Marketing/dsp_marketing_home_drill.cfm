
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
	Revision 1.0  2005/02/15 20:50:50  daugherty
	Initial revision

	Revision 1.2  2001-11-30 11:59:05-05  french
	Fixing report access error and de-stetzering..

	Revision 1.1  2001-10-11 10:56:00-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	Variables:
	END FUSEDOC --->
<cfoutput query="get_marketing_home_drill">
	<tr <cfif currentrow MOD 2>bgcolor="##E1E1E1"<cfelse>bgcolor="##BAEE9B"</cfif> class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">#Description#</td>
		<td class="RegText#session.workstream_text_size#">#Status#</td>
	</tr>
</cfoutput>

