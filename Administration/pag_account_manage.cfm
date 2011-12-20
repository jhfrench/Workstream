
<!--Administration/pag_account_manage.cfm
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
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
</cfsilent>
<cfform action="index.cfm?fuseaction=Administration.edit_account" name="timekeeping_options" method="POST">
<cfoutput>
<table align="center" bgcolor="##cccccc" border="0" cellpadding="0" cellspacing="0">
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Account Management" section_color="808080" colspan="5" gutter=0 title_class="HeadText">
	<tr valign="top" class="RegText">
		<td>&nbsp;Choose an account to edit:</td>
		<td>
			<cfmodule template="../common_files/dsp_team_select.cfm" size="7" class="RegText">
		</td>
	</tr>
		<cfmodule template="../common_files/dsp_submit_options.cfm" include_reset="0" submit_value="Manage this account">
</table>
</cfoutput>
</cfform>

