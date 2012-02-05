<!-- Administration/act_edit_nsm_entity.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_nsm_entity.cfm">
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

<cfinclude template="qry_get_nsm_entity.cfm">

<cftransaction>
	<cfquery name="update_ref_organization" datasource="#application.datasources.main#">
	UPDATE REF_Organization
	SET description='#attributes.description#'<!--- ,
		organization_code='#attributes.organization_code#' --->
	WHERE organization_id=#attributes.organization_id#
	</cfquery>
	<cfquery name="update_hierarchy_assignment" datasource="#application.datasources.main#">
	UPDATE Hierarchy_Assignment
	SET active_ind=0
	WHERE hierarchy_assignment_id=#attributes.hierarchy_assignment_id#
	</cfquery>
	<cfinclude template="qry_insert_hierarchy_assignment.cfm">
</cftransaction>