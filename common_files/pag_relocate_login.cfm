<!-- common_files/pag_relocate_login.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="pag_relocate_login.cfm">
	<responsibilities>
		I determine the appropriate default fuesaction and send the logged in user to that page.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="9/9/9" role="FuseCoder" comments="Created File">
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

<cfswitch expression="#cgi.http_host#">
	<cfcase value="nash.hitsshq.com,nvdb.hitsshq.com,bronze.sef.hq.nasa.gov,nvdb.sef.hq.nasa.gov,brass.hq.nasa.gov,nvdb.hq.nasa.gov,nvdb.nasa.gov">
		<cflocation url="index.cfm?fuseaction=Search.search_vendors" addtoken="no">
	</cfcase>
	<cfcase value="vendors.nvdb.hitsshq.com,vendors.nvdb.sef.hq.nasa.gov,vendors.nvdb.hq.nasa.gov,vendors.nvdb.nasa.gov">
		<cflocation url="index.cfm?fuseaction=Vendor.challenge_screen" addtoken="no">
	</cfcase>
	<cfdefaultcase>
		<cfset variables.error=variables.unknown_url>
	</cfdefaultcase>
</cfswitch>