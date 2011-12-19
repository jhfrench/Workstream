<!-- Administration/pag_manually_add_nsm.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_manually_add_nsm.cfm">
	<responsibilities>
		I help the user maintain the NSM structure.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/17/2007" role="FuseCoder" comments="Created File">
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

<table width="100%" cellpadding="0" cellspacing="0" border="0" summary="table head describes the data held in the table below">
	<tr>
		<th align="left"><h2 style="margin:0px"><a href="index.cfm?fuseaction=Administration.manage_nsm_structure">Manage NSM Structure</a> &gt; Manually Add NSM Entity</h2>
		</th>
	</tr>
</table><img src="images/spacer.gif" alt="" width="560" height="1" /><br />

<cfparam name="attributes.step" default="1">
<cfinclude template="pag_edit_ref_organization.cfm">