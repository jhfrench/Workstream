
<!--Search/dsp_navigation.cfm
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
Revision 1.1  2006/04/07 17:02:03  csy
task 42742 Modified link to point to search screen

Revision 1.0  2005-02-15 15:58:19-05  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:27-04  long
added $log $ for edits.  To all CFM files that have fusedocs.

 (KL | 9/28/2001) evaluating for Display_To_Nav
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
				<a href="#request.dir_level#Search/<cfif custom_ind>#custom_url#<cfelse>index.cfm?fuseaction=#action#</cfif>" class="NavText#session.workstream_text_size#">#lcase(report_name)#</a>&nbsp;|&nbsp;
			</cfif>	
		</cfoutput>
<cfoutput>
			<a href="#request.dir_level#index.cfm?fuseaction=Administration.search_options" class="NavText#session.workstream_text_size#">options</a>
		</td>
		<td align="left" bgcolor="##0000ff"><img src="#request.dir_level##application.application_specific_settings.image_dir#angle_middle.gif" border="0" height="18" width="21"></td>
	</tr>
</cfoutput>

