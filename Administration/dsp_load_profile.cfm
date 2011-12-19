
<!--Admin/dsp_load_profile.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the timekeeping options.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2006/09/15 22:29:25  csy
<>

Revision 1.0  2006-08-16 09:32:00-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:23-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:38-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr valign="top">
		<td align="center" colspan="2" valign="top" class="RegText#session.workstream_text_size#">
			<br>&nbsp;<br>&nbsp;Select a profile: <cfselect name="profile_id" query="profile_lookup" value="profile_id" display="profile_name" size="2" required="Yes" message="Please choose a profile to load." class="RegText#session.workstream_text_size#"></cfselect><br>&nbsp;<br>&nbsp;
		</td>
	</tr>
</cfoutput>

