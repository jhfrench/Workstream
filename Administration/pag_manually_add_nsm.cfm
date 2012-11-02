<!-- Administration/pag_manually_add_nsm.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manually_add_nsm.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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

<ul class="breadcrumb">
  <li><a href="index.cfm?fuseaction=Administration.manage_nsm_structure">Manage NSM Structure</a> <span class="divider">/</span></li>
  <li class="active">Manually Add NSM Entity</li>
</ul>

<cfparam name="attributes.step" default="1">
<cfinclude template="pag_edit_ref_organization.cfm">