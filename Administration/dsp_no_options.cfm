
<!--timekeeping/dsp_no_options.cfm
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
Revision 1.1  2006/09/15 22:27:27  csy
<>

Revision 1.0  2006-08-16 09:32:01-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:26-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:36-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfinclude template="../common_files/qry_get_teams.cfm">
	<tr valign="top">
		<td align="center" colspan="2" valign="top" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<br>&nbsp;
			No options available.
			<br>&nbsp;
		</td>
	</tr>
	
