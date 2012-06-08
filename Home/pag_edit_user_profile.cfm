<!-- common_files/pag_edit_user_profile.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_user_profile.cfm">
	<responsibilities>
		I display the form for editing user profile and act(send information to DB) when the form is submitted.
	</responsibilities>
		I display the form for editing user and act(send information to DB) when the form is submitted.
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/3/2007" role="FuseCoder" comments="Created File">
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

<cfinclude template="act_edit_user_profile.cfm">
<cfinclude template="dsp_edit_user_profile.cfm">

