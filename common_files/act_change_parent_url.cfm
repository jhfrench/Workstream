<!-- common_files/act_change_parent_url.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_change_parent_url.cfm">
	<responsibilities>
		If the user's session timed out make them sign back in. Usually this is handled by the act_security.cfm template, but the loophole can happen in an iframe outside the normal scope of the application.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="11/30/2009" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
			attributes.target_fuseaction
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
<cfparam name="attributes.target_fuseaction" default="">
<cfif NOT isdefined("session.user_account_id")>
	<script type="text/javascript">
		parent.change_parent_url('http<cfif comparenocase(cgi.HTTPS,"OFF")>s</cfif>://<cfoutput>#cgi.server_name##cgi.script_name#<cfif len(attributes.target_fuseaction)>?fuseaction=#attributes.target_fuseaction#</cfif></cfoutput>');	
	</script>
	<cfabort>
</cfif>