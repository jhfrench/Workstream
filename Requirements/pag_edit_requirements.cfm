<!-- Requirements/pag_edit_requirements.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_requirements.cfm">
	<responsibilities>
		I present the user with a form to edit a specific requirement. I also show the history of that requirement.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfif isdefined("attributes.screen_id")>
	<!--- if we're submitting requirement details, commit the new info to the DB --->
	<cfinclude template="act_edit_requirements.cfm">
</cfif>

<cfset attributes.requirement_type_id=0>
<cfinclude template="../common_files/qry_get_requirement_type.cfm">
<cfinclude template="qry_get_priority.cfm">
<cfinclude template="qry_get_fuseactions.cfm">
<cfinclude template="qry_get_requirement.cfm">
<cfmodule template="qry_get_ref_product_version.cfm" product_version_id="#get_requirement.product_version_id#">
<cfinclude template="dsp_edit_requirements.cfm">

<!--- this will show any predecessors to this requirement. It calls itself, building a history of the requirement. --->
<cfmodule template="dsp_requirements_history.cfm" replacement_requirement_id="#attributes.requirement_id#">