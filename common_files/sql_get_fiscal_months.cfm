/* common_files/sql_get_fiscal_months.cfm
	Author: Jeromy French */
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="sql_get_variance_explanation_months.cfm">
	<responsibilities>
		I retrieve months/years for which we have uploaded plan (actuals) data.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="2/21/2007" role="FuseCoder" comments="Created File">
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
SELECT REF_Program_Year.program_year_id, REF_Program_Year.description AS year_description, REF_Program_Year.sort_order AS year_sort_order,
	Month_Data.month_id, Month_Data.month_description, Month_Data.month_sort_order
FROM REF_Program_Year
	INNER JOIN (
		SELECT program_year_id, 10 AS month_id, 'Oct' AS month_description, 1 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_oct,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 11 AS month_id, 'Nov' AS month_description, 2 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_nov,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 12 AS month_id, 'Dec' AS month_description, 3 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_dec,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 1 AS month_id, 'Jan' AS month_description, 4 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_jan,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 2 AS month_id, 'Feb' AS month_description, 5 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_feb,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 3 AS month_id, 'Mar' AS month_description, 6 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_mar,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 4 AS month_id, 'Apr' AS month_description, 7 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_apr,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 5 AS month_id, 'May' AS month_description, 8 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_may,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 6 AS month_id, 'Jun' AS month_description, 9 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_jun,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 7 AS month_id, 'Jul' AS month_description, 10 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_jul,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 8 AS month_id, 'Aug' AS month_description, 11 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_aug,0)!=0
		GROUP BY program_year_id
		UNION ALL
		SELECT program_year_id, 9 AS month_id, 'Sep' AS month_description, 12 AS month_sort_order
		FROM Upload_BW_Plan_Data
		WHERE active_ind=1
			AND COALESCE(Upload_BW_Plan_Data.data_sep,0)!=0
		GROUP BY program_year_id
	) Month_Data ON REF_Program_Year.program_year_id=Month_Data.program_year_id