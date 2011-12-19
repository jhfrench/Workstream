
<!--timekeeping/dsp_no_options.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the timekeeping options.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfinclude template="../common_files/qry_get_teams.cfm">
	<tr valign="top">
		<td align="center" colspan="2" valign="top" class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">
			<br>&nbsp;
			No options available.
			<br>&nbsp;
		</td>
	</tr>
	
