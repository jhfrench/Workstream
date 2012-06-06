
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
 --->
<cfparam name="session.workstream_expand" default="yes,yes,no">
<cfswitch expression="#session.workstream_text_size#">
	<cfcase value="Lg">
		<cfset request.fontsize=12>
	</cfcase>
	<cfcase value="Md">
		<cfset request.fontsize=11>
	</cfcase>
	<cfdefaultcase>
		<cfset request.fontsize=10>
	</cfdefaultcase>
</cfswitch>
<cfset variables.tree_expand=listdeleteat(session.workstream_expand,1)>
</cfsilent>
	<tr align="center">
		<td colspan="5">
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
