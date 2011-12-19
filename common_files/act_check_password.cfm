<!-- common_files/act_check_password.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_check_password.cfm">
	<responsibilities>
		I check password to be sure it complies with 2810 requirements.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfparam name="caller.variables.password_accepted_ind" default="0">

<!--- check against last 10 passwords --->
<cfinclude template="act_check_password_last_10.cfm">
<cfif variables.password_last_10_check_passes EQ 1>
	<!--- check that password has all the necessary letters, numbers, caps, special char, etc --->
	<cfinclude template="act_check_password_text.cfm">
<cfelse>
	<cfset variables.display_message="<li>The password supplied has been used within the last 10 password entries. Please choose another password.">
</cfif>
<cfset caller.variables.display_message=variables.display_message>
