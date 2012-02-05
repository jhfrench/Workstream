<!-- Administration/pag_edit_user.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_edit_user.cfm">
	<responsibilities>
		I display the form for editing user and act(send information to DB) when the form is submitted.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/6/2007" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/6/7) I moved this template from common_files because it's only being called from the Administration module.
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

<cfinclude template="act_edit_user.cfm">
<cfinclude template="dsp_edit_user_form.cfm">
