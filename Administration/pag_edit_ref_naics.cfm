<!-- Administration/pag_edit_ref_naics.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_naics.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2009" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.naics_id" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.code" default="">
<cfparam name="attributes.sort_order" default="">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_naics.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_naics.cfm">
</cfif>

<cfinclude template="dsp_edit_ref_naics.cfm">

