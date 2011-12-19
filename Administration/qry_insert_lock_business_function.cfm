<!-- Administration/qry_insert_lock_business_function.cfm
	Author: Omoniyi Fajemidupe-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_lock_business_function.cfm">
	<responsibilities>
		I lock business functions.
	</responsibilities>
	<properties>
		<history email="omoniyi.fajemidupe-1@nasa.gov" author="Omoniyi Fajemidupe" type="create" date="8/9/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_lock_business_function" datasource="#application.datasources.main#">
INSERT INTO Lock_Business_Function(business_function_id,comments,created_by)
	VALUES(#i#, '#business_function_comments#', #session.user_account_id#)
</cfquery>


