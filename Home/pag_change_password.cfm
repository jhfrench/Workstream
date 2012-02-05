<!--Home/pag_change_password.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_change_password.cfm">
	<responsibilities>
		I allow the user to change his/her password.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/30/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="attributes.action" default="edit_user">
<cfparam name="attributes.method" default="">
<cfparam name="attributes.requested_page" default="#application.fusebox.defaultfuseaction#">
<cfparam name="attributes.password" default="">
<cfparam name="attributes.confirm_password" default="">
<cfparam name="attributes.user_account_id" default="#session.user_account_id#">
<cfparam name="variables.display_message" default="">

<cfif NOT comparenocase(attributes.method, "Change Password")>
	<!--- <cfif len(attributes.confirm_password)> --->
		<cfinclude template="act_change_password.cfm">
		<cfif variables.password_accepted_ind>
			<cflocation url="index.cfm?fuseaction=#attributes.requested_page#" addtoken="no">
		<!--- </cfif> --->
	</cfif>
</cfif>
<!--- add the query needed --->
<cfinclude template="../common_files/qry_get_user_information.cfm">
<!--- display edit form --->
<cfinclude template="dsp_change_password.cfm">
