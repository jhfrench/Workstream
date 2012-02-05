<!-- Administration/qry_deactivate_business_function.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_deactivate_business_function.cfm">
	<responsibilities>
	I deactivate business functions
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Omoniyi Fajemidupe" type="create" date="8/9/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="deactivate_business_function" datasource="#application.datasources.main#">
UPDATE Lock_Business_Function
SET active_ind=0
WHERE active_ind=1
</cfquery>


