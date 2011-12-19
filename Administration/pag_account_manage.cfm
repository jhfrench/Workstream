
<!--timekeeping/pag_account_manage.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream task list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2006/09/15 22:28:18  csy
<>

Revision 1.0  2006-08-16 09:32:06-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:31-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:34-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfform action="index.cfm?fuseaction=edit_account" name="timekeeping_options" method="POST">
<cfoutput>
<table align="center" bgcolor="##cccccc" border="0" cellpadding="0" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Account Management" section_color="808080" colspan="5" gutter=0 title_class="HeadText#session.workstream_text_size#">
	<tr valign="top" class="RegText#session.workstream_text_size#">
		<td>&nbsp;Choose an account to edit:</td>
		<td>
			<cfmodule template="../common_files/dsp_team_select.cfm" size="7" class="RegText#session.workstream_text_size#">
		</td>
	</tr>
		<cfmodule template="dsp_submit_options.cfm" include_reset="0" submit_value="Manage this account">
</table>
</cfoutput>
</cfform>

