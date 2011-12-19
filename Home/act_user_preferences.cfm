<!-- Home/act_user_preferences.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_user_preferences.cfm">
	<responsibilities>
		I act (send information to DB) when a user selects preferences and submits the form.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/2/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.display_message" default="">
<cfparam name="attributes.user_preferences_id" default="0">
<cfparam name="attributes.program_year_id" default="1">
<cfparam name="attributes.numeric_multiplier_id" default="1">
<cfparam name="attributes.text_size" default="none">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.submit")>
	<!--- deactivate old record --->
	<cfinclude template="../common_files/qry_deactivate_user_preferences.cfm">
	<!--- insert new record --->
	<cfinclude template="../common_files/qry_insert_user_preferences.cfm">
	<cfset attributes.display_message="Your preferences have been updated.">
</cfif>

<cfinclude template="../common_files/qry_get_user_preferences.cfm">
<cfinclude template="../common_files/qry_get_user_program_year_access.cfm">