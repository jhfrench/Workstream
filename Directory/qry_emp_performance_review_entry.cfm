
<!--Directory/qry_emp_performance_review_entry.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I insert a performnce review record.
	||
	Name: Damon Scott
	||
	Edits: 
	
	||
	
 --->

	<cfquery name="get_old_review" datasource="#application.datasources.main#">
		SELECT TOP 1 date_recorded, performance_review_id
		FROM Performance_Review
		WHERE emp_id = '#form.emp_id#'
		ORDER BY date_recorded DESC
	</cfquery>
	
	<cfif get_old_review.recordcount>
		<cfset attributes.deactivate_record = 1>
	<cfelse>
		<cfset attributes.deactivate_record = 0>
	</cfif>
	
<cfquery name="emp_performance_review_entry" datasource="#application.datasources.main#">
INSERT INTO Performance_Review
	(emp_id,
	 rating,
	 date_recorded,
	 review_type_id,
	 active_ind,
	 reviewer_id,
	 date_reviewed)
VALUES
	(#form.emp_id#,
	'#form.rating#',
	#Now()#,
	#review_type#,
	1,
	#form.reviewer_id#,
	'#form.date_reviewed#')
</cfquery>

</cfsilent>

