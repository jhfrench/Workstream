<!-- Administration/pag_edit_ref_numeric_multiplier.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_numeric_multiplier.cfm">
	<responsibilities>
		I display the form for editing numeric multiplier and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/26/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.numeric_multiplier_id" default="0">
<cfparam name="attributes.divisor_to_1" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.numeric_format_mask" default="999,999,999">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- this is to validate the new mask. If the mask is wrong, this will error --->
	<cfset variables.tested_format=numberformat(1000,attributes.numeric_format_mask)>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_numeric_multiplier.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_numeric_multiplier.cfm">
	<!--- <cfset attributes.numeric_multiplier_id=0>  --->
	<cflocation url="index.cfm?fuseaction=#attributes.fuseaction#">
</cfif>

<cfinclude template="../common_files/qry_get_numeric_multiplier.cfm">

<cfinclude template="dsp_edit_ref_numeric_multiplier.cfm">

