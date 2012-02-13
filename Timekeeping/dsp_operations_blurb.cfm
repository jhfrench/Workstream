
<!--Timekeeping/dsp_operations_blurb.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the notes_id of the latest (and greatest) entry into Notes.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
 --->
</cfsilent>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008000" section_title="Account Mgmt Dashboard" title_class="HeadTextWhite">
	<tr>
		<td colspan="2" style="text-align:center;">
			<div id="operations_blurb" style="text-align:right;">
				<cfoutput query="operations_blurb">
					<p style="right:0px; white-space:nowrap;" class="RegText">#customer#&nbsp;<span style="width: 300px;"><img src="images/bar_7.gif" height="10" width="#green_stretch#" alt="#customer# projects in green status." /><img src="images/bar_3.gif" height="10" width="#yellow_stretch#" alt="#customer# projects in yellow status." /><img src="images/bar_1.gif" height="10" width="#red_stretch#" alt="#customer# projects in trouble." /></span></p>
				</cfoutput>
			</div>
			<a href="index.cfm?fuseaction=Reports.engagement_dashboard" class="RegText">Click here for full project details and timelines.</a>
		</td>
	</tr>
</table>