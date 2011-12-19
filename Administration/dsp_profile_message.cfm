
<!--Admin/dsp_profile_message.cfm
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
Revision 1.1  2006/09/15 22:27:38  csy
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
		<td align="center" colspan="2" valign="top" class="SubHeadText#session.workstream_text_size#">
			<br>&nbsp;
			<br>&nbsp;
			Your profile has been <cfif comparenocase(listlast(attributes.fuseaction, '.'),"load_profile")>sav<cfelse>load</cfif>ed.
			<br>&nbsp;
			<br>&nbsp;
		</td>
	</tr>
</cfoutput>

