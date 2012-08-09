<!-- Administration/dsp_copy_user_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_copy_user_access.cfm">
	<responsibilities>
		I display the form for helping administrator to copy user access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/30/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 9/9/9) Making corrections depicted in 508_jm_2009_09_09_7.png.

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

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="alphabet_navigation" fuseaction="Administration.copy_user_access" field_name="last_initial" field_value="" processform="1" source_user_account_id="#attributes.source_user_account_id#">
<h2>Copy User Access</h2>

<cfoutput>#attributes.display_message#
<a href="##form_copy_user_access" title="hidden browser link to skip alphabetical navigation" style="position:absolute;top:-90em;left:-100em;"></a>
<div class="btn-toolbar">
	<div class="btn-group">
	<cfloop list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" index="variables.character_ii">
		<a href="javascript:alphabet_navigation('#variables.character_ii#');" class="btn btn-mini">#variables.character_ii#</a>
	</cfloop>
	<a href="javascript:alphabet_navigation('');" class="btn btn-mini">All</a>
	</div>
</div>
<cfform name="form_copy_user_access" id="form_copy_user_access" action="index.cfm?fuseaction=Administration.copy_user_access" method="post">
<table class="table table-striped table-bordered table-condensed">
	<thead>
		<tr>
			<th>Select User</th>
			<th>Last Name</th>
			<th>First Name</th>
			<th>Username</th>
			<th>Center</th>
		</tr>
	<thead>
	<tbody>
	<cfloop query="get_user_information">
		<tr>
			<td><cfinput type="#variables.form_element_type#" name="#variables.form_element_label#" value="#user_account_id#" id="user_account_id_#user_account_id#" required="yes" message="Please choose a user." /></td>
			<td>#last_name#</td>
			<td>#first_name#</td>
			<td scope="row"><label for="user_account_id_#user_account_id#">#user_name#</label></td>
			<td>#center_abbreviation#</td>
		</tr>
	</cfloop>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" align="center">
			<cfif attributes.source_user_account_id NEQ 0>
				<input type="hidden" name="source_user_account_id" value="#attributes.source_user_account_id#"/>
			</cfif>
				<input type="submit" name="submit" value="#variables.submit_label#" class="btn btn-primary"/>
				<input type="button" name="cancel" value="Cancel" onclick="window.history.go(-1)" class="btn" />
			</td>
		</tr>
	</tfoot>
</table>
</cfform>
</cfoutput>