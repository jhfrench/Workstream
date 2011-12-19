
<!--Admin/dsp_save_profile.cfm
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
Revision 1.1  2006/09/15 22:29:41  csy
<>

Revision 1.0  2006-08-16 09:32:02-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:28-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:36-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfoutput>
	<tr valign="top">
		<td align="center" colspan="2" valign="top" class="RegText#session.workstream_text_size#">
			<br>&nbsp;<br>&nbsp;Profile name: <cfinput type="Text" name="profile_name" required="Yes" message="Please enter a profile name." class="RegText#session.workstream_text_size#">
		</td>
	</tr>
	<tr valign="top">
		<td align="center" colspan="2" valign="top" class="RegText#session.workstream_text_size#">
			<label for="primary_profile"><input type="checkbox" name="primary_profile" id="primary_profile" class="RegText#session.workstream_text_size#"> Make this my primary profile</label><br>&nbsp;<br>&nbsp;
		</td>
	</tr>
</cfoutput>

