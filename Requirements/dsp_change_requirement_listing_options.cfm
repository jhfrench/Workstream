<!-- Requirements/dsp_change_requirement_listing_options.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_change_requirement_listing_options.cfm">
	<responsibilities>
		I help the user to show or hide general requirements.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/31/2007" role="FuseCoder" comments="Created File">
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

<cfif isdefined("attributes.hide_general_requirements")>
	<cfset session.hide_general_requirements=1>
	Hide system-wide requirements
<cfelse>
	<cfset session.hide_general_requirements=0>
	Show system-wide requirements
</cfif>
<br />
<cfif isdefined("attributes.hide_module_all")>
	<cfset session.hide_module_all=1>
	Hide module general requirements
<cfelse>
	<cfset session.hide_module_all=0>
	Show module general requirements
</cfif>
<br />
<cfif isdefined("attributes.hide_coded_requirements")>
	<cfset session.hide_coded_requirements=1>
	Hide completed requirements
<cfelse>
	<cfset session.hide_coded_requirements=0>
	Show completed requirements
</cfif>