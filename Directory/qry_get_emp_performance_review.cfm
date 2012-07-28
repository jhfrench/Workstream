
<!--Directory/qry_get_emp_performance_review.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees performance review info.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log: 

	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested

 --->
<cfquery name="get_emp_performance_review_info" datasource="#application.datasources.main#">
SELECT Performance_Review.performance_review_id, Performance_Review.rating, Performance_Review.date_reviewed,
	REF_Review_Type.description, Reviewer.lname, Reviewer.name
FROM Performance_Review
	INNER JOIN REF_Review_Type ON Performance_Review.review_type_id = REF_Review_Type.review_type_id
	INNER JOIN Emp_Contact AS Reviewer ON Performance_Review.reviewer_id=Reviewer.emp_id
WHERE Performance_Review.emp_id=#attributes.emp_id#
ORDER BY Performance_Review.date_reviewed, Reviewer.lname
</cfquery>
</cfsilent>
