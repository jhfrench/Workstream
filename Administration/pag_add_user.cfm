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
<cfparam name="attributes.method" default="">
<cfparam name="variables.display_message" default="">

<cfswitch expression="#attributes.method#">
	<cfcase value="Add User">
		<cfinclude template="../common_files/act_add_user.cfm">
		<cfif len(variables.display_message)>
			<div class="alert alert-error"><cfoutput>#variables.display_message#</cfoutput></div>
		</cfif>
	</cfcase>

	<!--- if the administrator selects a user --->
	<cfdefaultcase>
		<cfinclude template="dsp_add_user_form.cfm">
	</cfdefaultcase>
</cfswitch>