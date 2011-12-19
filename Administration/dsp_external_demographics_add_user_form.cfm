<!-- Administration/dsp_external_demographics_add_user_form.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_external_demographics_add_user_form.cfm">
	<responsibilities>
		I display the user information in a form when new user is to be added.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.method" default="">
<cfparam name="attributes.reset" default="">
<cfparam name="attributes.first_name" default="">
<cfparam name="attributes.last_name" default="">
<cfparam name="attributes.middle_initial" default="">
<cfparam name="attributes.uupic" default="">
<cfparam name="attributes.email_address" default="">
<cfparam name="attributes.work_phone" default="">
<cfparam name="attributes.center_id" default="0">
<cfparam name="attributes.user_name" default="">

<!--- since we can only get description of center from external demographics warehouse, we have to get a corresponding id from our table to faster query running --->
<cfmodule template="../common_files/qry_get_ref_center.cfm" display_all_centers_ind="0" center_abbreviation="#get_external_demographics_data.ou#">

<cfform action="index.cfm?fuseaction=Administration.add_user" method="post" name="Add_user_form">
<cfif attributes.uupic EQ 0>
	<!--- if a new user without record in ldap --->
	<cfinclude template="dsp_add_user_not_in_ldap.cfm">
<cfelse>
	<cfinclude template="dsp_add_user_in_ldap.cfm">
</cfif>
</cfform>