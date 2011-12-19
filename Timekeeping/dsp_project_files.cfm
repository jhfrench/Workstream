
<!--Timekeeping/dsp_project_files.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve and display all the files from the public directory of the customer.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
<cfset variables.valid_files="cfm,doc,htm,msg,pdf,ppt,sql,txt,xls,zip">
</cfsilent>
<cfset dir_to_go_to = '\\192.168.0.152\attatched_files\workstream\Project_Planning\' & <!--- #variables.company# --->#attributes.project_planning_id# & '\'>
<cfdirectory action="LIST" directory="#dir_to_go_to#" name="project_files">
<tr>
	<td>&nbsp;<!--- <cfoutput>#dir_to_go_to#</cfoutput> ---></td>
</tr>
	<cfmodule template="../common_files/dsp_section_title.cfm" section_title="&nbsp;Associated files" section_color="78A0EB" colspan="5" gutter="0" title_class="HeadText#session.workstream_text_size#">
<cfoutput>
<tr bgcolor="##c0c0c0">
	<td>&nbsp;</td>
	<td class="SubHeadText#session.workstream_text_size#">Name</td>
	<td class="SubHeadText#session.workstream_text_size#">Last Modified</td>
	<td>&nbsp;</td>
</tr>
</cfoutput>
<cfoutput query="project_files" <!--- startrow="3" --->>
<cfset variables.file_img="NA">
<cfif listfindnocase(variables.valid_files,left(listlast(name,"."),3))>
	 <cfset variables.file_img=left(listlast(name,"."),3)> 
</cfif>
<tr>
	<td>&nbsp;</td>
	<td class="RegText#session.workstream_text_size#"><a href="../../project_planning/#attributes.project_planning_id#/#name#" target="_blank" class="RegText#session.workstream_text_size#"><img src="#request.dir_level##application.application_specific_settings.image_dir#icon_#variables.file_img#.gif" valign="bottom" width="16" height="16" border="0"> #name#</a></td>
	<td class="RegText#session.workstream_text_size#">#datelastmodified#</td>
	<td>&nbsp;</td>
</tr>
</cfoutput>


