<!-- Administration/pag_edit_ref_program_year.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_program_year.cfm">
	<responsibilities>
		I display the form for editing program year and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/27/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.program_year_id" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.sort_order" default="">
<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_program_year.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_program_year.cfm">
</cfif>

<cfinclude template="../common_files/qry_get_program_year.cfm">

<cfinclude template="dsp_edit_ref_program_year.cfm">