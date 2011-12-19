<!-- common_files/act_upload_fund.cfm
	Author: Jeromy French-->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_upload_fund.cfm">
	<responsibilities>
		I populate the REF_Fund and Link_Program_Year_Fund tables.
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="8/16/2007" role="FuseCoder" comments="Created File">
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

<cfif isdefined("attributes.source_table")>
	<!--- create new REF_Fund records after making sure the new fund is not already in the database --->
	<cfquery name="insert_ref_fund" datasource="#application.datasources.main#">
	INSERT INTO REF_Fund (description, created_by)
	SELECT #attributes.source_table#.#attributes.source_column#, #session.user_account_id#
	FROM #attributes.source_table#
	WHERE #attributes.source_table#.active_ind=1
		AND #attributes.source_table#.#attributes.source_column# IS NOT NULL
		AND #attributes.source_table#.#attributes.source_column# NOT IN (
			SELECT description
			FROM REF_Fund
			)
	GROUP BY #attributes.source_table#.#attributes.source_column#
	</cfquery>
</cfif>

<!--- find any funds that don't have a record in Link_Program_Year_Fund --->
<cfquery name="get_new_fund_for_link_program_year_fund" datasource="#application.datasources.main#">
SELECT fund_id, REVERSE(SUBSTRING(REVERSE(description),2, 4)) AS year_description,
	CASE REVERSE(SUBSTRING(REVERSE(description),6, 1))
		WHEN '0' THEN '1000'
		ELSE REVERSE(SUBSTRING(REVERSE(description),6, 1))
	END AS year_multiple
FROM REF_Fund
WHERE active_ind=1
	AND fund_id NOT IN (
		SELECT fund_id
		FROM Link_Program_Year_Fund
		WHERE active_ind=1)
</cfquery>

<cfif get_new_fund_for_link_program_year_fund.recordcount>
	<cfloop query="get_new_fund_for_link_program_year_fund">
		<cfset variables.year_multiple=year_multiple>
		<cfif isnumeric(variables.year_multiple)>
			<cfset attributes.fund_program_year_assigned_ind=1>
			<!--- associate the fund with each year to which it is assigned --->
			<cfquery name="insert_link_program_year_fund" datasource="#application.datasources.main#">
			INSERT INTO Link_Program_Year_Fund (program_year_id, fund_id, created_by)
			SELECT program_year_id, #fund_id#, #session.user_account_id#
			FROM REF_Program_Year
			WHERE active_ind=1
				AND description BETWEEN '#year_description#' AND '#year_description+variables.year_multiple-1#' /*we subtract one so that the fund won't be applied to an extra year (we count the year the fund was initiatied)*/
			</cfquery>
		</cfif>
	</cfloop>
</cfif>

<!--- reorder the REF_Fund table by customer supplied logic (first four, then year, then year multiplier)--->
<cfmodule template="../common_files/act_administer_sorter_table.cfm" use_transaction_ind="0" table_to_sort="REF_Fund" id_of_sorted_column="fund_id" text_of_sorted_column="description" order_by="LPAD(description,4), SUBSTRING(description,LEN(description)-4,5) DESC, SUBSTRING(description,5,1) DESC">