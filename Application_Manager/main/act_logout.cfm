<!-- Home/act_logout.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_logout.cfm">
	<responsibilities>
		I log a user out.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="7/18/2007" role="FuseCoder" comments="Created File">
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

<cftry>
	<!--- SET A LOCK --->
	<cflock timeout="3" name="#session.sessionid#" type="exclusive">
		<!--- LOOP OVER THE COLLECTION OF SESSION VARS --->
		<cfloop collection="#session#" item="session_variable_ii">
			<!--- USE STRUCTDELETE TO DESTROY INDIVIDUAL SESSION VARS --->
			<cfset structdelete(session, session_variable_ii)>
		</cfloop>
	</cflock>

	<cfcatch type="any">
		<!--- IGNORE ANY ERRORS THAT OCCUR WHILE CLEANING UP THE SESSION --->
	</cfcatch>
</cftry>

<cfparam name="attributes.requested_page" default="#application.fusebox.defaultfuseaction#">
<cflocation url="index.cfm?fuseaction=Home.login&requested_page=#attributes.requested_page#" addtoken="no">