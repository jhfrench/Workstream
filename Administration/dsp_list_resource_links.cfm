<!-- Administration/dsp_list_resource_links.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_list_resource_links.cfm">
	<responsibilities>
		Page to display a list of resource area links.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/30/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Cleaning up verbiage and row coloring.
		</history>
	</properties>
	<IO>
		<in>

		</in>
		<passthrough>

		</passthrough>
		<out>

		</out>
	</IO>
</fusedoc>
--->

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="administer_bw_reports" fuseaction="Administration.administer_bw_reports" field_name="bw_report_links_id">

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="Table displays administor resource area">
	<tr>
		<th align="left">
			<h2 style="margin:0px" id="top-side">Administer Resource Area</h2>
		</th>
	</tr>
	<tr>
		<td align="left" class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="javascript:administer_bw_reports(0);">Add Resource Link</a></td>
	</tr>
</table>

<div class="datachart" style="border:1px solid #999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="table head describes the data held in the table within this table">
	<tr align="left" bgcolor="#999999">
		<th>Link Type</th>
		<th>Link Label</th>
		<th>Date Created</th>
	</tr>
	<cfoutput query="get_bw_report_links">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
		<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">
			<td><a href="javascript:administer_bw_reports(#bw_report_links_id#);">#resource_link_type#</a></td>
			<td><a href="javascript:administer_bw_reports(#bw_report_links_id#);">#link_label#</a></td>
			<td><a href="javascript:administer_bw_reports(#bw_report_links_id#);">#dateformat(created_date,"mm/dd/yyyy")#</a></td>
		</tr>
	</cfoutput>
</table>
</div>