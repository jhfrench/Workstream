<!-- Administration/pag_specify_module_for_nsm_edit.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_specify_module_for_nsm_edit.cfm">
	<responsibilities>
		I allow the user to specify the module for which they want to administer NSM privileges.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/31/2007" role="FuseCoder" comments="Created File">
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
<cfinclude template="../common_files/qry_get_ref_module.cfm">

<cfinclude template="dsp_specify_module_for_nsm_edit.cfm">