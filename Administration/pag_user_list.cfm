<!-- Administration/pag_user_list.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_user_list.cfm">
	<responsibilities>
		I am a page that displays user list for password reset or editing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="administer_user_menu" fuseaction="Administration.administer_user_menu" field_name="user_account_id">
<!--- include all user query --->
<cfinclude template="../common_files/qry_get_user_information.cfm">

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the table below">
	<tr>
		<th align="left">
			<h2 style="margin:0px" id="top-side">List of Users</h2>
		</th>
	</tr>
</table>

<cfoutput>#attributes.display_message#</cfoutput>
<cfoutput>
<div class="datachart" style="border:1px solid ##999999">
<table cellpadding="3" cellspacing="0" width="100%" border="0" summary="Table displays user information">
	<tr align="left" bgcolor="##999999">
		<th><label for="last_name">Last Name</label></th>
		<th><label for="first_name">First Name</label></th>
		<th><label for="username">Username</label></th>
	</tr>
	<cfloop query="get_user_information">
	<cfif currentrow MOD 2>
		<cfset variables.row_color="eeeeee">
	<cfelse>
		<cfset variables.row_color="dddddd">
	</cfif>
	<tr bgcolor="###variables.row_color#" onmouseover="this.bgColor='##cfdee3';this.style.cursor='hand';" onmouseout="this.bgColor='###variables.row_color#';this.style.cursor='default';" onclick="javascript:Element.toggle('var_id_#currentrow#'); return false;">
		<td><a href="javascript:administer_user_menu(#user_account_id#)">#last_name#</a></td>
		<td><a href="javascript:administer_user_menu(#user_account_id#)">#first_name#</a></td>
		<td><a href="javascript:administer_user_menu(#user_account_id#)">#user_name#</a></td>
	</tr>
	</cfloop>
</table>
</div>
</cfoutput>
