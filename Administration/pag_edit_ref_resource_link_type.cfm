<!-- Administration/pag_edit_ref_resource_link_type.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_resource_link_type.cfm">
	<responsibilities>
		I display the form for editing resource link type and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/6/2007" role="FuseCoder" comments="Created File">
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

<a name="begin_page_content"></a>
<cfparam name="attributes.resource_link_type_id" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.sort_order" default="">
<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_resource_link_type.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_resource_link_type.cfm">
	<cfset attributes.resource_link_type_id=0>
</cfif>

<cfinclude template="../common_files/qry_get_ref_resource_link_type.cfm">

<cfinclude template="dsp_edit_ref_resource_link_type.cfm">