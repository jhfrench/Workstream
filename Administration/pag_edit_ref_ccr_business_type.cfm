<!-- Administration/pag_edit_ref_module.cfm
	Author: Lyudmila Klimenko-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_ccr_business_type.cfm">
	<responsibilities>
		I display the form for editing module and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="lyudmila.klimenko-1@nasa.gov" author="Lyudmila Klimenko" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.ccr_ogranization_type_id" default="0">
<cfparam name="attributes.description" default="">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_ccr_business_type.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_ccr_business_type.cfm">
</cfif>

<cfinclude template="../common_files/qry_get_ref_ccr_business_type.cfm">

<cfinclude template="dsp_edit_ref_ccr_business_type.cfm">

