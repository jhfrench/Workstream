<!-- Administration/dsp_manage_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_manage_user_access.cfm">
	<responsibilities>
		Page to help administrator to manage user access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/30/2007" role="FuseCoder" comments="Created File">
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

<h2>Manage User Access</h2>
<cfoutput>#attributes.display_message#
<div style="position:absolute;top:-90em;left:-100em;">
	<a href="##begin_table_content" title="hidden browser link to skip alphabetical navigation"></a>
</div>
Filter: <cfloop query="get_ref_account_status"> <a href="javascript:status_filter(#account_status_id#);" title="Filter to show only #lcase(description)# accounts.">#description#</a> |</cfloop> <a href="javascript:status_filter(0);" title="Filter to show all accounts.">All</a>
<div style="width:100%">
	<cfloop list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" index="variables.character_ii">
		<a href="javascript:alphabet_navigation('#character_ii#');" title="Filter to show only last names beginning with '#variables.character_ii#'">#variables.character_ii#</a> | 
	</cfloop>
	<a href="javascript:alphabet_navigation('');" title="Remove any last name filter">All</a>
</div>

<a name="begin_table_content"></a>
<cfform name="select_user_to_manage" action="index.cfm?fuseaction=Administration.edit_navigation_access" method="post">
<table class="table table-striped table-bordered table-condensed" summary="Table displays accounts whose access can be managed.">
	<tr>
		<th>Edit User</th>
		<th>Last Name</th>
		<th>First Name</th>
		<th>Username</th>
		<th>Center</th>
		<th>Status</th>
	</tr>
	<cfloop query="get_user_information">
	<tr>
		<td><cfinput type="checkbox" name="user_account_id" id="user_account_id_#user_account_id#" value="#user_account_id#" required="yes" message="Please choose at least one user to administer." /></td>
		<td>#last_name#</td>
		<td>#first_name#</td>
		<td scope="row"><label for="user_account_id_#user_account_id#">#user_name#</label></td>
		<td>#center_abbreviation#</td>
		<td>#account_status#</td>
	</tr>
	</cfloop>
	<cfmodule template="../common_files/dsp_program_year.cfm" colspan="4">
	<tr bgcolor="##dddddd">
		<td align="center" colspan="6">
			<input type="submit" name="method" value="Select" class="btn btn-primary" />
			<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
		</td>
	</tr>
</table>
</cfform>
</cfoutput> 