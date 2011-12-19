<!-- common_files/qry_get_user_program_year_access.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_user_program_year_access.cfm">
	<responsibilities>
		I retrieve, in order, all the years a specified user has access.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="10/8/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_user_program_year_access" datasource="#application.datasources.main#">
SELECT REF_Program_Year.description, REF_Program_Year.program_year_id, REF_Program_Year.sort_order
FROM Access_User_Business_Function
	INNER JOIN REF_Program_Year ON Access_User_Business_Function.program_year_id=REF_Program_Year.program_year_id
WHERE REF_Program_Year.active_ind=1
	AND Access_User_Business_Function.active_ind=1
	AND Access_User_Business_Function.user_account_id=#session.user_account_id#
GROUP BY REF_Program_Year.description, REF_Program_Year.program_year_id, REF_Program_Year.sort_order
ORDER BY REF_Program_Year.sort_order DESC
</cfquery>
<cfset caller.get_user_program_year_access=get_user_program_year_access>