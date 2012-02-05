<!-- Administration/dsp_manage_user_profiles.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_manage_user_profiles.cfm">
	<responsibilities>
		I help the administrator to manage user profile.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/30/2007" role="FuseCoder" comments="Created File">
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

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="alphabet_navigation" fuseaction="Administration.manage_user_profiles" field_name="last_initial" field_value="">
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the tables below">
	<tr>
		<th align="left">
			<h2 style="margin:0px" id="top-side">Manage User Profiles</h2>
		</th>
	</tr>
	<tr>
		<td align="left" class="menuItem" bgcolor="#eeeeee" onmouseover="new Effect.Highlight(this, {duration:0.1,startcolor:'#5394bd',endcolor:'#5394bd',restorecolor:'#5394bd'});this.style.cursor='pointer';" onmouseout="new Effect.Highlight(this, {duration:0.25,startcolor:'#999999',endcolor:'#bbbbbb',restorecolor:'#eeeeee'});"><a href="index.cfm?fuseaction=Administration.add_user">Add user</a></td>
	</tr>
</table>

<img src="images/spacer.gif" alt="" width="560" height="1"><br />
<cfoutput>#attributes.display_message#

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="Tables displays user search">
	<tr>
		<th align="left">
			<cfloop list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" index="character_ii">
				<a href="javascript:alphabet_navigation('#character_ii#');">#character_ii#</a> | 
			</cfloop>
			<a href="javascript:alphabet_navigation('');">All</a>
		</th>
	</tr>
</table>

<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="Table displays user search criteria">
	<tr bgcolor="##999999">
		<th align="left"><label for="last_name"></label>Last Name</label></th>
		<th align="left"><label for="first_name">First Name</label></th>
		<th align="left"><label for="username">Username</label></th>
		<th align="left"><label for="center">Center</label></th>
	</tr>
	<cfloop query="get_user_information">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">
		<td id="last_name" scope="row"><a href="javascript:administer_user_menu(#user_account_id#)">#last_name#</a></td>
		<td id="first_name"><a href="javascript:administer_user_menu(#user_account_id#)">#first_name#</a></td>
		<td id="username"><a href="javascript:administer_user_menu(#user_account_id#)">#user_name#</a></td>
		<td id="center"><a href="javascript:administer_user_menu(#user_account_id#)">#center_abbreviation#</a></td>
	</tr>
	</cfloop>
</table>
</div>
</cfoutput>
