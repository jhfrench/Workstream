<!-- Home/dsp_edit_user_profile.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="dsp_edit_user_profile.cfm">
	<responsibilities>
		I help the user to edit his/her own profile.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/3/2007" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.user_account_id" default="0">

<cfoutput>
#attributes.display_message#
</cfoutput>
<cfinclude template="dsp_edit_user_profile_form.cfm">
