<!-- Home/index.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="index.cfm">
	<responsibilities>
		I am an empty page that redirects the user to the main index.cfm page (and login screen). My primary purpose is to prevent directory listing.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="6/19/2007" role="FuseCoder" comments="Created File">
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
<cflocation url="../index.cfm?fuseaction=Home.login&requested_page=#application.fusebox.defaultfuseaction#" addtoken="no">