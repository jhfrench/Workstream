<!--- Administration/pag_edit_ref_geographic_area.cfm
	Author: Ping Liang--->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_geographic_area.cfm">
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

<cfparam name="attributes.geographic_area_id" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.code" default="">	
<cfparam name="attributes.sort_order" default="">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_geographic_area.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_geographic_area.cfm">
</cfif>

<cfinclude template="dsp_edit_ref_geographic_area.cfm">

