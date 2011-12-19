
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
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
 <cfset variables.module_access=valuelist(get_module_navigation.module_description)>
<cfset temp_action=attributes.fuseaction>
<cfif ListContains("save_profile,load_profile",attributes.fuseaction)>
	<cfset attributes.fuseaction="admin_options">
</cfif>
<cfset list_len=get_module_navigation.recordcount*2+1>
<cfset before_this=(ListFindNoCase(variables.module_access,ListFirst(attributes.fuseaction,"_"))-1)*2>
<cfset after_this=list_len-before_this-3>
<cfset counter=0>
</cfsilent>
<cfoutput>
	<tr bgcolor="##ffffff">
		<td bgcolor="##ffffff" colspan="#request.colspan#">
		<table bgcolor="##cccccc" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td bgcolor="##cccccc" height="15"><img src="#request.dir_level##application.application_specific_settings.image_dir#tab_far_left.gif" width="18" height="15" alt="" border="0">&nbsp;</td>
		<cfloop list="#variables.module_access#" index="ii"><cfset counter=incrementvalue(counter)><cfif counter NEQ 1><td height="15"><img src="#request.dir_level##application.application_specific_settings.image_dir#tab_middle_<cfif compare(listfirst(attributes.fuseaction,"_"),lcase(ii))>right<cfelse>left</cfif>.gif" width="18" height="20" alt="" border="0"></td></cfif><td align="center" height="15" width="70" bgcolor="##cccccc"><a href="index.cfm?fuseaction=Timekeeping.#lcase(ii)#_options" class="NavText#session.workstream_text_size#">&nbsp;#lcase(ReplaceNoCase(ii,"admin","general","ALL"))#</a></td>
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

