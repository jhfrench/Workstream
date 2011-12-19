<!-- Administration/dsp_manage_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_manage_user_access.cfm">
	<responsibilities>
		Page to help administrator to manage user access.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/30/2007" role="FuseCoder" comments="Created File">
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

<h2 style="margin:0px">Manage User Access</h2>
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
<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" cols="6" summary="Table displays accounts whose access can be managed.">
	<tr bgcolor="##999999">
		<th align="left" scope="col">Edit User</th>
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
			<input type="submit" name="method" value="Select" alt="Select" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput> 