<!-- common_files/pag_relocate_login.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_relocate_login.cfm">
	<responsibilities>
		I determine the appropriate default fuesaction and send the logged in user to that page.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/9/9" role="FuseCoder" comments="Created File">
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
<cflocation url="index.cfm?fuseaction=#application.fusebox.defaultfuseaction#" addtoken="no">