
<!--admin/dsp_pass_success.cfm
	Author: Victor B-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Notifies user of succesful change to password.
	||
	Name: Victor Blell
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->


<table align="center" 
		bgcolor="#cccccc" 
		border="0" 
		cellpadding="0" 
		cellspacing="0" 
		class="RegText#session.workstream_text_size#">



<cfinclude template="qry_get_user_details.cfm">
<table width="50%"  align="center" bgcolor="#cccccc" border="0" cellpadding="0" cellspacing="0" class="RegText#session.workstream_text_size#">
	<cfmodule template="../common_files/dsp_section_title.cfm" 
					section_title="&nbsp;Password Change (#get_user_details.lname#, #get_user_details.name#)" 
					section_color="808080" colspan="5" 
					gutter=0 
					title_class="HeadText#session.workstream_text_size#">



	<tr><td height="10%">&nbsp;</td></tr>




	
	<tr>
		<td class="RegText#session.workstream_text_size#" height="50%">
			Your password has been successfully changed.
			<cfif isdefined("session.workstream_last_password_date") and len(session.workstream_last_password_date)>
			<br>
				Your password will need to be changed again after: 
				<cfoutput><strong>#dateformat(session.workstream_last_password_date, "mmmm d, yyyy")#</strong></cfoutput>
			<br>
			</cfif>
		</td>
	</tr>
	<tr><td height="10%">&nbsp;</td></tr>
</table>
