<!-- common_files/act_set_browser_specific_attributes.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_set_browser_specific_attributes.cfm">
	<responsibilities>
		I set browser specific attributes.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/5/2007" role="FuseCoder" comments="Created File">
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

<!--- if IE --->
<cfif listfindnocase(cgi.http_user_agent,"MSIE"," ")>
	<cfset variables.text_set_method="innerText">
<!--- otherwise --->
<cfelse>
	<cfset variables.text_set_method="textContent">
</cfif>