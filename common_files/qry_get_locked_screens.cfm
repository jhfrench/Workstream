<!-- Common_files/qry_get_locked_screens.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_locked_screens.cfm">
	<responsibilities>
		I am the query that gets pages that are locked in FAAD.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="9/6/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_locked_screens" dbtype="query">
SELECT fuseaction
FROM Get_User_Access
WHERE locked_ind=1
</cfquery>
