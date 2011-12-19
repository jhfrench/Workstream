<!-- Administration/dsp_manage_user_profiles.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_manage_user_profiles.cfm">
	<responsibilities>
		I help the administrator to manage user profile.
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

<h2 style="margin:0px">Manage User Profiles</h2>
<cfoutput>#attributes.display_message#
Filter: <cfloop query="get_ref_account_status"> <a href="javascript:status_filter(#account_status_id#);" title="Filter to show only #lcase(description)# accounts.">#description#</a> |</cfloop> <a href="javascript:status_filter(0);" title="Filter to show all accounts.">All</a>
<div style="width:100%">
	<cfloop list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" index="variables.character_ii">
		<a href="javascript:alphabet_navigation('#character_ii#');" title="Filter to show only last names beginning with '#variables.character_ii#'">#variables.character_ii#</a> | 
	</cfloop>
	<a href="javascript:alphabet_navigation('');" title="Remove any last name filter">All</a>
</div>

<a name="begin_table_content"></a>
<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" cols="5" summary="Table displays profiles that can be managed.">
	<tr bgcolor="##999999">
		<th align="left" scope="col">Last Name</th>
		<th align="left" scope="col">First Name</th>
		<th align="left" scope="col">Username</th>
		<th align="left" scope="col">Center</th>
		<th align="left" scope="col">Status</th>
	</tr>
	<cfloop query="get_user_information">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td>#last_name#</td>
		<td>#first_name#</td>
		<td scope="row"><a href="javascript:administer_user_menu(#user_account_id#)">#user_name#</a></td>
		<td>#center_abbreviation#</td>
		<td>#account_status#</td>
	</tr>
	</cfloop>
</table>
</div>
</cfoutput>
