<!-- Home/act_edit_user_profile.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_edit_user_profile.cfm">
	<responsibilities>
		I act (send information to DB) when a user edits his/her own profile and submits the form.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/3/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.display_message" default="">

<!--- this is for updateing the edit form --->
<cfif NOT comparenocase(attributes.method,"Update Information")>
	<!--- handle demographics changes --->
	<cfinclude template="../common_files/qry_deactivate_demographics.cfm">
	<cfinclude template="../common_files/qry_insert_demographics.cfm">
	<cfset attributes.created_by=session.user_account_id>
	<cfset attributes.display_message="User information was successfully updated.">
</cfif>

<cfinclude template="../common_files/qry_get_ref_center.cfm">
<cfinclude template="../common_files/qry_get_user_information_profile.cfm">

