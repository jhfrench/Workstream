<!-- Home/pag_user_preferences.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_user_preferences.cfm">
	<responsibilities>
		I display the form for editing user preferences and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/2/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="act_user_preferences.cfm">
<!--- have to include header from this spot, otherwise the displayed program year needs an extra screen load to catch up --->
<cfinclude template="../common_files/act_header.cfm">
<cfinclude template="dsp_user_preferences.cfm">