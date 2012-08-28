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
<cfscript>
	if (NOT isdefined("attributes.action")) {
		attributes.action="edit_user";
	}
	if (NOT isdefined("attributes.confirm_password")) {
		attributes.confirm_password="";
	}
	if (NOT isdefined("attributes.method")) {
		attributes.method="";
	}
	if (NOT isdefined("attributes.old_password")) {
		attributes.old_password="";
	}
	if (NOT isdefined("attributes.password")) {
		attributes.password="";
	}
	if (NOT isdefined("attributes.requested_page")) {
		attributes.requested_page=application.fusebox.defaultfuseaction;
	}
	if (NOT isdefined("attributes.user_account_id")) {
		attributes.user_account_id=variables.user_identification;
	}
	variables.display_message="";
</cfscript>

<cfif NOT comparenocase(attributes.method, "Change Password")>
		<cfinclude template="act_change_password.cfm">
		<cfif variables.password_accepted_ind>
			<cflocation url="index.cfm?fuseaction=#attributes.requested_page#" addtoken="no">
		</cfif>
</cfif>

<cfinclude template="../common_files/qry_get_user_information.cfm">
<cfinclude template="dsp_change_password.cfm">
