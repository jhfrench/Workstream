<!-- Administration/pag_add_user.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_add_user.cfm">
	<responsibilities>
		I display the result of the center an dlastname search of external demographics warehouse. I also allow a selection for further processing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="6/18/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.last_name" default="">
<cfparam name="attributes.center_description" default="">
<cfparam name="variables.display_message" default="">
<cfparam name="attributes.method" default="">

<cfswitch expression="#attributes.method#">
	<cfcase value="search">
		<!--- check if the user enters a last name --->
		<cfif NOT len(attributes.last_name)>
			<cfset variables.display_message=variables.display_message & "<br />Please enter lastname">
		</cfif>
		<cfif len(variables.display_message)>
			<!--- if there's a problem, redisplay the search form --->
			<cfinclude template="dsp_external_demographics_search.cfm">
		<cfelse>
			<!--- if the user selects a center and enters a lastname then process in external demographics warehouse --->
			<cfinclude template="act_search_user_from_external_demographics.cfm">
		</cfif>
	</cfcase>

	<cfcase value="select_user">
		<cfinclude template="qry_get_external_demographics_data.cfm">
		<cfinclude template="dsp_external_demographics_add_user_form.cfm">
	</cfcase>

	<cfcase value="Add User">
		<cfinclude template="../common_files/act_add_user.cfm">
		<cfif len(variables.display_message)>
			<div class="alert alert-error">#variables.display_message#</div>
		</cfif>
	</cfcase>

	<!--- if the administrator selects a user --->
	<cfdefaultcase>
		<cfinclude template="dsp_external_demographics_search.cfm">
	</cfdefaultcase>
</cfswitch>

