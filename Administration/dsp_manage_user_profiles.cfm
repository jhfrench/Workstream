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
<h2>Manage User Profiles</h2>
<a href="index.cfm?fuseaction=Administration.add_user" class="btn">Add user</a>
<cfoutput>#attributes.display_message#
<a href="##manage_user_profiles_table" title="hidden browser link to skip alphabetical navigation" style="position:absolute;top:-90em;left:-100em;"></a>
<div class="btn-toolbar">
	<div class="btn-group">
	<cfloop list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" index="variables.character_ii">
		<a href="javascript:alphabet_navigation('#variables.character_ii#');" class="btn btn-mini">#variables.character_ii#</a>
	</cfloop>
	<a href="javascript:alphabet_navigation('');" class="btn btn-mini">All</a>
	</div>
</div>

<table id="manage_user_profiles_table" class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Last Name</th>
			<th>First Name</th>
			<th>Username</th>
			<th>Center</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_user_information">
	<tr>
		<td><a href="javascript:administer_user_menu(#user_account_id#)">#last_name#</a></td>
		<td><a href="javascript:administer_user_menu(#user_account_id#)">#first_name#</a></td>
		<td scope="row"><a href="javascript:administer_user_menu(#user_account_id#)">#user_name#</a></td>
		<td><a href="javascript:administer_user_menu(#user_account_id#)">#center_abbreviation#</a></td>
	</tr>
	</cfloop>
	</tbody>
</table>
</cfoutput>
