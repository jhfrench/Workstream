<!-- Administration/qry_insert_link_program_year_fund.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_insert_link_program_year_fund.cfm">
	<responsibilities>
		I insert new fund into Link_Program_Year_Fund_table.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="8/20/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="insert_link_program_year_fund" datasource="#application.datasources.main#">
INSERT INTO Link_Program_Year_Fund (program_year_id, fund_id, created_by)
VALUES (#attributes.program_year_id#, #attributes.fund_id#, #variables.user_identification#)
</cfquery>