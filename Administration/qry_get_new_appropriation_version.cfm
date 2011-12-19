<!-- Administration/qry_get_new_appropriation_version.cfm
	Author: Kelly Poon-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_new_appropriation_version.cfm">
	<responsibilities>
		
	</responsibilities>
	<properties>
		<history email="kpoon@hq.nasa.gov" author="Kelly Poon" type="create" date="4/12/2008" role="FuseCoder" comments="Created File">
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

<cfquery name="get_new_appropriation_version" datasource="#application.datasources.main#">
	SELECT appropriation_version_id
	FROM Appropriation_Version
	WHERE active_ind=1
		AND description='#attributes.version_description#'
		AND l_p_y_f_id=#get_link_program_year_fund.l_p_y_f_id#
</cfquery>