
<!-- common_files/qry_get_link_program_year_fund.cfm
	Author: Jeromy French-->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_link_program_year_fund.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="2/29/2008" role="FuseCoder" comments="Created File">
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
<cfparam name="attributes.program_year_id" default="0">
<cfparam name="attributes.fund_id" default="0">
<cfquery name="get_link_program_year_fund" datasource="#application.datasources.main#">
SELECT *
FROM Link_Program_Year_Fund
WHERE active_ind=1<cfif attributes.program_year_id NEQ 0>
	AND program_year_id=#attributes.program_year_id#</cfif><cfif attributes.fund_id NEQ 0>
	AND fund_id=#attributes.fund_id#</cfif>
</cfquery>
<cfset caller.get_link_program_year_fund=get_link_program_year_fund>