<!-- Administration/pag_edit_ref_center.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_center.cfm">
	<responsibilities>
		I display the form for editing center and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/16/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.center_id" default="0">
<cfparam name="attributes.submit" default="">
<cfparam name="variables.display_message" default="">
<cfparam name="variables.check_form_field" default="0">
<cfparam name="attributes.description" default="">
<cfparam name="attributes.abbreviation" default="">
<cfparam name="attributes.center_code" default="">
<cfparam name="attributes.sort_order" default="">
<cfinclude template="../common_files/qry_get_ref_center.cfm">
<!--- if the submit button is pressed --->
<cfif NOT comparenocase(attributes.submit, "submit")>
	<!--- if no input date in description, display message --->
	<cfif NOT len(attributes.description)>
		<cfset variables.display_message=variables.display_message & "<br />Please enter description.">
		<cfset variables.check_form_field=variables.check_form_field+1>
	</cfif>
	<cfif NOT len(attributes.abbreviation)>
		<cfset variables.display_message=variables.display_message & "<br />Please enter abbreviation.">
		<cfset variables.check_form_field=variables.check_form_field+1>
	</cfif>
	<cfif NOT len(attributes.center_code)>
		<cfset variables.display_message=variables.display_message & "<br />Please enter center code.">
		<cfset variables.check_form_field=variables.check_form_field+1>
	</cfif>
	<cfif NOT len(attributes.sort_order)>
		<cfset variables.display_message=variables.display_message & "<br />Please enter sort_order.">
		<cfset variables.check_form_field=variables.check_form_field+1>
	</cfif>
	<!--- if there is no error --->
	<cfif variables.check_form_field EQ 0>
	<!--- DO YOUR PROCESSING --->
		<cfif isdefined("attributes.created_by")>
		<!--- deactivate old record --->
		<cfinclude template="qry_deactivate_ref_center.cfm">
		<!--- insert new record --->
		<cfinclude template="qry_insert_ref_center.cfm">
		<cfset attributes.center_id=0>
		</cfif>
	</cfif>
</cfif>

<cfinclude template="dsp_edit_ref_center.cfm">