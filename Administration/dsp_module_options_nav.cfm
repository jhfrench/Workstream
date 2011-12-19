
<!--Admin/dsp_module_options_nav.cfm
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
Revision 1.1  2006/09/15 22:29:33  csy
<>

Revision 1.0  2006-08-16 09:32:00-04  csy
Initial revision

Revision 1.0  2005-02-15 15:27:25-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:37-04  long
Added $log $ for edits to all CFM files that have fusedocs.

 
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfset temp_action=attributes.fuseaction>
<cfif ListContains("save_profile,load_profile",attributes.fuseaction)>
	<cfset attributes.fuseaction="admin_options">
</cfif>
<cfset list_len=listlen(session.workstream_module_access)*2+1>
<cfset before_this=(ListFindNoCase(session.workstream_module_access,ListFirst(attributes.fuseaction,"_"))-1)*2>
<cfset after_this=list_len-before_this-3>
<cfset counter=0>
</cfsilent>
<cfoutput>
	<tr bgcolor="##ffffff">
		<td bgcolor="##ffffff" colspan="#request.colspan#">
		<table bgcolor="##cccccc" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="##cccccc" height="15"><img src="#request.dir_level##application.application_specific_settings.image_dir#tab_far_left.gif" width="18" height="15" alt="" border="0">&nbsp;</td>
		<cfloop list="#session.workstream_module_access#" index="ii"><cfset counter=incrementvalue(counter)><cfif counter NEQ 1><td height="15"><img src="#request.dir_level##application.application_specific_settings.image_dir#tab_middle_<cfif compare(listfirst(attributes.fuseaction,"_"),lcase(ii))>right<cfelse>left</cfif>.gif" width="18" height="20" alt="" border="0"></td></cfif><td align="center" height="15" width="70" bgcolor="##cccccc"><a href="index.cfm?fuseaction=#lcase(ii)#_options" class="NavText#session.workstream_text_size#">&nbsp;#lcase(ReplaceNoCase(ii,"admin","general","ALL"))#</a></td>
				</cfloop><td height="15" bgcolor="##cccccc">&nbsp;<img src="#request.dir_level##application.application_specific_settings.image_dir#tab_far_right.gif" width="18" height="15" alt="" border="0"></td>
			</tr>
			<tr>
				<cfif before_this><td background="#request.dir_level##application.application_specific_settings.image_dir#tab_bottom_left.gif" colspan="#before_this#"><img src="#request.dir_level##application.application_specific_settings.image_dir#tab_bottom_left.gif" width="1" height="2" alt="" border="0"></td></cfif>
				<td colspan="3"></td>
				<cfif after_this><td background="#request.dir_level##application.application_specific_settings.image_dir#tab_bottom_right.gif" colspan="#after_this#"><img src="#request.dir_level##application.application_specific_settings.image_dir#tab_bottom_right.gif" width="1" height="2" alt="" border="0"></td></cfif>
			</tr>
		</table>
		</td>
	</tr>
</cfoutput>
<cfset attributes.fuseaction=temp_action>

