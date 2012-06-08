<!-- Administration/pag_edit_ref_product_version.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_product_version.cfm">
	<responsibilities>
		I display the form for editing program version and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/24/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.product_version_id" default="0">
<cfparam name="attributes.scheduled_release_date" default="">
<cfparam name="attributes.description" default="">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_product_version.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_product_version.cfm">
	<cfset attributes.product_version_id=0>
</cfif>

<cfinclude template="qry_get_ref_product_version.cfm">

<cfinclude template="dsp_edit_ref_product_version.cfm">