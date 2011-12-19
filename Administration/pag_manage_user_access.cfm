<!-- Administration/pag_manage_user_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manage_user_access.cfm">
	<responsibilities>
		Page to help administrator to manage user access.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="7/30/2007" role="FuseCoder" comments="Created File">
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

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the tables below this table">
	<tr>
		<th align="left">
			<h2 style="margin:0px" id="top-side">Manage User Access</h2>
		</th>
	</tr>
</table>

<img src="images/spacer.gif" alt="" width="560" height="1"><br />
<cfoutput>
<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="Table displays user search criteria">
	<tr>
		<th align="left">
			<cfloop list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" index="character_ii">
				<a href="javascript:alphabet_navigation('#character_ii#');">#character_ii#</a> | 
			</cfloop>
			<a href="javascript:alphabet_navigation('');">All</a>
		</th>
	</tr>
</table>

<cfform name="select_user_to_manage" action="index.cfm?fuseaction=Administration.view_user_access" method="post">
<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="Table displays user search criteria">
	<tr align="left" bgcolor="##999999">
		<th>
			Edit User
		</th>
		<th>
			Last Name
		</th>
		<th>
			First Name
		</th>
		<th>
			Username
		</th>
	</tr>
	<cfloop query="get_user_information">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';">
		<td>
			<cfinput type="checkbox" name="user_account_id" id="user_account_id_#user_account_id#" value="#user_account_id#" required="yes" message="Please choose at least one user to administer." />
		</td>
		<td>
			<label for="user_account_id_#user_account_id#">#last_name#</label>
		</td>
		<td>
			<label for="user_account_id_#user_account_id#">#first_name#</label>
		</td>
		<td scope="row">
			<label for="user_account_id_#user_account_id#">#user_name#</label>
		</td>
	</tr>
	</cfloop>
	<cfmodule template="../common_files/dsp_program_year.cfm" col_span="3">
	<tr bgcolor="##999999">
		<td align="center" colspan="4">
			<input type="submit" alt="Select" name="method" value="Select" />
			<input type="button" name="cancel" value="Cancel" alt="cancel" onclick="window.history.go(-1)" />
		</td>
	</tr>
</table>
</div>
</cfform>
</cfoutput> 