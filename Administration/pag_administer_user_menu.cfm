<!-- Administration/pag_administer_user_menu.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_administer_user_menu.cfm">
	<responsibilities>
		Help the administrator to manage user profile.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.user_account_id" default="0">
<cfinclude template="../common_files/qry_get_ref_center.cfm">
<cfmodule template="../common_files/qry_get_ref_account_status.cfm">
<cfinclude template="act_administer_user_menu.cfm">
<cfinclude template="dsp_administer_user_menu.cfm">
