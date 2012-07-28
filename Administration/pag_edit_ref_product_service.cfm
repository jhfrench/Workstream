<!--- Administration/pag_edit_ref_product_service.cfm
	Author: Ping Liang--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_product_service.cfm">
	<responsibilities>
		I display the form for editing ccr status and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="PLiang@nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.product_service_id" default="0">
<cfparam name="attributes.description"   default="">
<cfparam name="attributes.code"          default="">
<cfparam name="attributes.sort_order"    default="">
<cfparam name="attributes.active_IND"    default="0">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_product_service.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_product_service.cfm">
</cfif>

<cfinclude template="dsp_edit_ref_product_service.cfm">

