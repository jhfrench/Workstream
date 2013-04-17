<!-- Administration/pag_view_user_access.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_view_user_access.cfm">
	<responsibilities>
		I help the user assign NSM structure privileges.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/31/2007" role="FuseCoder" comments="Created File">
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

<!--- get user name --->
<cfinclude template="../common_files/qry_get_user_information.cfm">

<!--- get all privileges except read --->
<cfmodule template="../common_files/qry_get_ref_privilege.cfm" exclude_privilege_id="1">
<h2>
	<ul class="breadcrumb">
		<li><a href="index.cfm?fuseaction=Administration.manage_user_access">Manage User Access</a> <span class="divider">/</span></li>
		<li class="active">View User Access</li>
	</ul>
</h2>
<cfset variables.show_buttons_ind=1>
<cfinclude template="dsp_view_user_access.cfm">