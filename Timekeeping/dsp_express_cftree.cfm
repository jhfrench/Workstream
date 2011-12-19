
<!--Timekeeping/dsp_express_cftree.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the cftree for the Timekeeping module's express entry page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
 --->
<cfparam name="session.workstream_expand" default="yes,yes,no">
<cfif NOT compare(session.workstream_text_size, "Lg")>
	<cfset request.fontsize=12>
<cfelseif NOT compare(session.workstream_text_size, "Md")>
	<cfset request.fontsize=11>
<cfelse>
	<cfset request.fontsize=10>
</cfif>
<cfset variables.tree_expand=listdeleteat(session.workstream_expand,1)>
</cfsilent>
	<tr align="center" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<td colspan="5" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>">
		<div style="z-index: -100;">
			<cfform enablecab="no" name="cftree_form" action="submit" method="post">
				<cftree name="express_tree" width="750" height="#session.workstream_express_tree_height#" font="Tahoma" fontsize="#request.fontsize#">
					<cftreeitem value="Workweek" parent="express_tree" expand="yes" img="remote" href="##">
					<cftreeitem value="Workweek,Workdays,time_entry_id" display="Workweek,Workdays,clientname_data" expand="#variables.tree_expand#" query="get_express_time_entries" parent="workweek" queryasroot="no" IMG="folder,folder,document" HREF="##,##, index.cfm?fuseaction=Timekeeping.time_entry_edit&coming_from=#attributes.fuseaction#&cache_escape=#variables.cache_escape#">
				</cftree>
			</cfform>
		</div>
		</td>
	</tr>
