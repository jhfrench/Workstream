<!-- Administration/pag_edit_ref_organization.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_organization.cfm">
	<responsibilities>
		I display the form for editing organization and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/5/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.organization_id" default="0">
<cfparam name="variables.display_message" default="">
<cfparam name="variables.check_form_field" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.organization_code" default="">
<cfparam name="attributes.abbreviation" default="">
<cfparam name="attributes.sort_order" default="">
<cfparam name="attributes.step" default="1">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_organization.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_organization.cfm">
</cfif>

<cfinclude template="../common_files/qry_get_ref_organization.cfm">

<cfinclude template="dsp_edit_ref_organization.cfm">
