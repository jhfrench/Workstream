
<!--Directory/qry_emp_performance_review_entry.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a performnce review record.
	||
	Name: Jeromy French
	||
	Edits: 

	 || 

 --->

	<cfquery name="get_old_review" datasource="#application.datasources.main#">
		SELECT TOP 1 created_date, performance_review_id
		FROM Performance_Review
		WHERE emp_id = '#attributes.emp_id#'
		ORDER BY created_date DESC
	</cfquery>

	<cfif get_old_review.recordcount>
		<cfset attributes.deactivate_record = 1>
	<cfelse>
		<cfset attributes.deactivate_record = 0>
	</cfif>

<cfquery name="emp_performance_review_entry" datasource="#application.datasources.main#">
INSERT INTO Performance_Review (emp_id, rating, created_date,
	 review_type_id, active_ind, reviewer_id,
	 date_reviewed)
VALUES (#attributes.emp_id#, '#attributes.rating#', CURRENT_TIMESTAMP,
	#review_type#, 1, #attributes.reviewer_id#,
	'#attributes.date_reviewed#')
</cfquery>

</cfsilent>

