
/* common_files/sql_get_x_years_ago.cfm
	Author: Jeromy French */
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="sql_get_x_years_ago.cfm">
	<responsibilities>
		Unfortunately the years in the REF_Program_Year table were not all populated sequentially. I return the program year ids that correspond to a range of years--you just need to provide the starting years, and how many years you want to go back (attributes.year_span as a negative number) or forward (positive number). This template is intended to be moduled from within a query block.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com author="Jeromy French" type="create" date="1/9/2008" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
			attributes.program_year_id: starting point for year span
			attributes.year_span: how many years you want to span back (a negative number) or forward (positive number)
		</in>
		<passthrough>

		</passthrough>
		<out>
			program_year_id: list of program_year_ids that correspond to the span of years you want returned
		</out>
	</IO>
</fusedoc>
--->
<cfoutput>
SELECT program_year_id
FROM REF_Program_Year
WHERE active_ind=1
	AND description BETWEEN (
		SELECT description+#attributes.year_span#
		FROM REF_Program_Year
		WHERE active_ind=1
			AND program_year_id=#attributes.program_year_id#)
	AND (
		SELECT description
		FROM REF_Program_Year
		WHERE active_ind=1
			AND program_year_id=#attributes.program_year_id#)
</cfoutput>