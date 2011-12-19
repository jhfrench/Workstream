
<!--Timekeeping/dsp_navigation.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the workstream project/engagement list.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:21:11  stetzer
<>

Revision 1.1  2001-10-11 10:55:10-04  long
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
				<a href="#request.dir_level#timekeeping/<cfif custom_ind><cfif len(custom_url)>#custom_url#<cfelse>#hyperlink#</cfif><cfelse>index.cfm?fuseaction=#action#</cfif>" class="NavText#session.workstream_text_size#">#lcase(report_name)#</a>&nbsp;|&nbsp;
			</cfif>										
		</cfoutput>
<cfoutput>
			<a href="#request.dir_level#index.cfm?fuseaction=Administration.timekeeping_options" class="NavText#session.workstream_text_size#">options</a>
		</td>
		<td align="left" bgcolor="##0000ff"><img src="#request.dir_level##application.application_specific_settings.image_dir#angle_middle.gif" border="0" height="18" width="21"></td>
	</tr>
</cfoutput>

