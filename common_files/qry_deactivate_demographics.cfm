<!-- common_files/qry_deactivate_demographics.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_demographics.cfm">
	<responsibilities>
		I deactivate demographics information.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<!--- make the old demographics information for the user inactive --->
<cfquery name="deactivate_demographics" datasource="#application.datasources.main#">
UPDATE Demographics
SET active_ind=0
WHERE active_ind=1
	AND user_account_id=#attributes.user_account_id#
</cfquery>