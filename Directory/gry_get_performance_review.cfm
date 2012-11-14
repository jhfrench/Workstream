
<!--Directory/gry_get_performance_review.cfm
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
	--> attributes.user_account_id: number containing the unique identifier of the individual being requested

 --->
<cfquery name="get_performance_review" datasource="#application.datasources.main#">
SELECT Performance_Review.performance_review_id, Performance_Review.rating, Performance_Review.date_reviewed,
	REF_Review_Type.description, Reviewer.last_name, Reviewer.first_name
FROM Performance_Review
	INNER JOIN REF_Review_Type ON Performance_Review.review_type_id = REF_Review_Type.review_type_id
	INNER JOIN Demographics AS Reviewer ON Performance_Review.reviewer_id=Reviewer.user_account_id
		AND Reviewer.active_ind=1
WHERE Performance_Review.active_ind=1
	AND Performance_Review.user_account_id=#attributes.user_account_id#
ORDER BY Performance_Review.date_reviewed, Reviewer.lname
</cfquery>
</cfsilent>
