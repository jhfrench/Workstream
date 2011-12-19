
<!--Admin/dsp_navigation.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream Admin navigation.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->

</cfsilent>
<cfoutput>
	<tr bgcolor="##808080">
		<td align="center" colspan="2" class="NavText#session.workstream_text_size#">
</cfoutput>
		<cfoutput query="get_navigation">
			<cfif Display_To_Nav>
				<a href="index.cfm?fuseaction=#action#" class="NavText#session.workstream_text_size#">#lcase(report_name)#</a><cfif currentrow NEQ recordcount>&nbsp;|&nbsp;</cfif>
			</cfif>
		</cfoutput>
<cfoutput>
		</td>
		<td align="left" bgcolor="##0000ff"><img src="#request.dir_level##application.application_specific_settings.image_dir#angle_middle.gif" border="0" height="18" width="21"></td>
	</tr>
</cfoutput>

