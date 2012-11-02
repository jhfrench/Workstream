<!-- Administration/pag_edit_system_note.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_system_note.cfm">
	<responsibilities>
		I display the form for editing system notes and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/22/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.system_note_id" default="0">
<cfparam name="attributes.note_text" default="">
<cfparam name="attributes.display_start_date" default="">
<cfparam name="attributes.display_end_date" default="">
<cfparam name="attributes.send_system_note" default="">
<cfparam name="variables.display_message" default="">
<cfset attributes.use_date_limitation_ind="0">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- make sure end date is after start date --->
	<cfif len(attributes.display_end_date) AND attributes.display_end_date LT attributes.display_start_date>
		<cfset variables.display_message="The end date (#attributes.display_end_date#) cannot be earlier than the start date (#attributes.display_start_date#).">
	 <cfelse>
		<!--- deactivate old record --->
		<cfinclude template="qry_deactivate_system_note.cfm">
		<!--- insert new record --->
		<cfinclude template="qry_insert_system_note.cfm">
	</cfif>
</cfif>

<cfinclude template="../common_files/qry_get_system_note.cfm">
<cfinclude template="dsp_edit_system_note.cfm">