<!-- Requirements/dsp_requirements_history.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_requirements_history.cfm">
	<responsibilities>
		I display a list of all predecessors of a requirement selected.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
			$Id:$
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

<cfinclude template="get_requirement_history.cfm">

<cfif NOT isdefined("attributes.show_comment_history_labels")>
<!--- only show this the first time this template is being called (it calls itself) --->
<h3 style="margin:0px">History for This Requirement:</h3>
<!--- History for this requirement: --->
<br />
<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="table displays requriemnt documents history">
	<cfif get_requirement_history.recordcount>
	<tr bgcolor="#999999">
		<th align="left"><label for="requirement_id">Requirement ID</label></th>
		<th align="left"><label for="requirement_number">Number</label></th>
		<th align="left"><label for="description">description</label></th>
		<th align="left"><label for="created_date">Created Date</label></th>
		<th align="left"><label for="requirement_author">Author</label></th>
	</tr>
	<cfelse>
	<tr bgcolor="#999999">
		<td align="left">Can't find predecessors for this requirement.</td>
	</tr>
	</cfif>
</cfif>

<cfif get_requirement_history.recordcount>
	<cfset attributes.requirement_id=get_requirement_history.requirement_id>
	<cfoutput query="get_requirement_history">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cccccc';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td id="requirement_id">#requirement_id#</td>
		<td id="requirement_number">#requirement_number#</td>
		<td id="description">#description#</td>
		<td id="created_date">#created_date#</td>
		<td id="requirement_author">#requirement_author#</td>
	</tr>
	</cfoutput>
	<cfmodule template="dsp_requirements_history.cfm" replacement_requirement_id="#attributes.requirement_id#" show_comment_history_labels="1">
</cfif>
</table>
</div>

