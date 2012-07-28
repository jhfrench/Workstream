<!--- Administration/pag_edit_ref_state_province.cfm
	Author: Ping Liang--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_state_province.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="PLiang@hq.nasa.gov" author="Ping Liang" type="create" date="7/7/2009" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.state_province_id" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.code" default="">
<cfparam name="attributes.sort_order" default="">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_state_province.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_state_province.cfm">
</cfif>

<cfinclude template="dsp_edit_ref_state_province.cfm">

