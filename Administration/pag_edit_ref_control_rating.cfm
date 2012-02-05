<!-- Administration/pag_edit_ref_control_rating.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_ref_control_rating.cfm">
	<responsibilities>
		I display the form for editing control_rating and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.control_rating_id" default="0">
<cfparam name="attributes.description" default="0">

<!--- if data has been submitted to this page, insert it into the DB --->
<cfif isdefined("attributes.created_by")>
	<!--- deactivate old record --->
	<cfinclude template="qry_deactivate_ref_control_rating.cfm">
	<!--- insert new record --->
	<cfinclude template="qry_insert_ref_control_rating.cfm">
</cfif>

<cfinclude template="qry_get_ref_control_rating.cfm">

<cfinclude template="dsp_edit_ref_control_rating.cfm">

