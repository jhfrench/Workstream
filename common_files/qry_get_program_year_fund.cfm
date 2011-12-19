<!-- common_files/qry_get_program_year_fund.cfm
	Author: Omoniyi Fajemidupe-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_program_year_fund.cfm">
	<responsibilities>
		I get fund control for the selected year.
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

<cfparam name="attributes.show_all_program_year_ind" default="1">
<cfparam name="attributes.program_year_id" default="0">
<cfparam name="attributes.fund_id" default="0">
<cfparam name="variables.called_from_fund_control" default="">
<cfquery name="get_program_year_fund" datasource="#application.datasources.main#">
SELECT REF_Program_Year.program_year_id, REF_Program_Year.description AS year_description, REF_Fund.fund_id,
	REF_Fund.description AS fund_description, Link_Program_Year_Fund.l_p_y_f_id
FROM REF_Program_Year
	INNER JOIN Link_Program_Year_Fund ON REF_Program_Year.program_year_id=Link_Program_Year_Fund.program_year_id
	INNER JOIN REF_Fund ON Link_Program_Year_Fund.fund_id=REF_Fund.fund_id<cfif isdefined("attributes.data_table")>
	INNER JOIN (
		SELECT l_p_y_f_id
		FROM #attributes.data_table#
		WHERE active_ind=1
		GROUP BY l_p_y_f_id
	) #attributes.data_table# ON Link_Program_Year_Fund.l_p_y_f_id=#attributes.data_table#.l_p_y_f_id</cfif>
WHERE REF_Program_Year.active_ind=1
	AND Link_Program_Year_Fund.active_ind=1
	AND REF_Fund.active_ind=1<cfif attributes.show_all_program_year_ind EQ 0 AND attributes.program_year_id NEQ 0>
	AND Link_Program_Year_Fund.program_year_id=#attributes.program_year_id#<cfelseif NOT isdefined("attributes.data_table")>
	AND REF_Program_Year.description <=(SELECT description FROM REF_Program_Year WHERE program_year_id=#session.program_year_id# AND active_ind=1)</cfif><cfif attributes.fund_id NEQ 0>
	AND Link_Program_Year_Fund.fund_id=#attributes.fund_id#</cfif><cfif len(variables.called_from_fund_control)>
	AND LPAD(SUBSTRING(REF_Fund.description,LEN(REF_Fund.description)-4),4)=REF_Program_Year.description</cfif>
ORDER BY REF_Program_Year.sort_order DESC, REF_Fund.sort_order
</cfquery>
<cfset caller.get_program_year_fund=get_program_year_fund>