
<!--Reports/dsp_navigation.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream Search navigation.
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
		<td align="center" colspan="2" class="NavText#session.workstream_text_size#"><cfloop list="reports" index="ii">
			<a href="index.cfm?fuseaction=#ii#" class="NavText#session.workstream_text_size#">#ListChangeDelims(ii," ","_")#</a>&nbsp;|&nbsp;
		</cfloop>
			<a href="#request.dir_level#index.cfm?fuseaction=Administration.reports_options" class="NavText#session.workstream_text_size#">options</a>
		</td>
		<td align="left" bgcolor="##0000ff"><img src="#request.dir_level##application.application_specific_settings.image_dir#angle_middle.gif" border="0" height="18" width="21"></td>
	</tr>
</cfoutput>

