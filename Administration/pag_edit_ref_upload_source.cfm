<!-- Administration/pag_edit_ref_upload_source.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_upload_source.cfm">
	<responsibilities>
		I display the form for editing records in REF_upload_source table and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.upload_source_id" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.abbreviation" default="">
<cfparam name="attributes.upload_template" default="">
<cfparam name="attributes.worksheet_name" default="">
<cfparam name="attributes.sort_order" default="">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_upload_source.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_upload_source.cfm">
	<cfset attributes.upload_source_id=0>
</cfif>

<cfinclude template="../common_files/qry_get_ref_upload_source.cfm">

<cfinclude template="dsp_edit_ref_upload_source.cfm">