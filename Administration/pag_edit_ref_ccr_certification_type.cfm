<!-- Administration/pag_edit_ref_ccr_certification_type.cfm
	Author: Ping Liang-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_ccr_certification_type.cfm">
	<responsibilities>
		I display the form for editing certification type and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="pliang@hq.nasa.gov" author="Ping Liang" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.ccr_certification_type_id" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.code" default="">
<cfparam name="attributes.sort_order" default="">
<cfparam name="attributes.active_ind" default="0">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_ccr_certification_type.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_ccr_certification_type.cfm">
</cfif>

<cfinclude template="dsp_edit_ref_ccr_certification_type.cfm">

