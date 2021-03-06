<!-- Administration/pag_manage_user_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_user_access.cfm">
	<responsibilities>
		Page to help administrator to manage user access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/30/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.method" default="">
<cfparam name="attributes.display_message" default="">
<!--- include all user query --->
<cfinclude template="../common_files/qry_get_user_information.cfm">

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="alphabet_navigation" fuseaction="Administration.manage_user_access" field_name="last_initial" field_value="">

<h2>Manage User Access</h2>
<cfoutput>
<a href="##select_user_to_manage" class="hide-text" aria-hidden="false">skip results filtering</a>
<div class="btn-toolbar">
	<div class="btn-group">
	<cfloop list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" index="variables.character_ii">
		<a href="javascript:alphabet_navigation('#variables.character_ii#');" title="Filter to show only last names beginning with '#variables.character_ii#'" class="btn btn-mini">#variables.character_ii#</a>
	</cfloop>
	<a href="javascript:alphabet_navigation('');" title="Remove any last name filter" class="btn btn-mini">All</a>
	</div>
</div>

<cfform name="select_user_to_manage" id="select_user_to_manage" action="index.cfm?fuseaction=Administration.view_user_access" method="post">
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Last Name</th>
			<th>First Name</th>
			<th>Username</th>
			<th>Edit User</th>
		</tr>
	</thead>
	<tbody>
	<cfloop query="get_user_information">
	<tr>
		<td>
			<label for="user_account_id_#user_account_id#">#last_name#</label>
		</td>
		<td>
			<label for="user_account_id_#user_account_id#">#first_name#</label>
		</td>
		<td scope="row">
			<label for="user_account_id_#user_account_id#">#user_name#</label>
		</td>
		<td>
			<cfinput type="checkbox" name="user_account_id" id="user_account_id_#user_account_id#" value="#user_account_id#" required="yes" message="Please choose at least one user to manage." />
		</td>
	</tr>
	</cfloop>
	</tbody>
	<tfoot>
		<cfmodule template="../common_files/dsp_program_year.cfm" col_span="3">
		<tr>
			<td align="center" colspan="4">
				<input type="submit" name="method" value="Select" class="btn btn-primary" />
				<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
			</td>
		</tr>
	</tfoot>
</table>
</cfform>
</cfoutput>