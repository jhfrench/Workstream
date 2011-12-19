
<!--Directory/qry_get_emp_performance_review.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve employees performance review info.
	||
	Name: Damon Scott
	||
	Edits: 
	$Log: 

	||
	Variables:
	--> attributes.emp_id: number containing the unique identifier of the individual being requested
	
 --->
<cfquery name="get_emp_performance_review_info" datasource="#application.datasources.main#">
	SELECT     Performance_Review.performance_review_id, Performance_Review.rating, Performance_Review.date_reviewed, REF_Review_Type.description,
                          (SELECT     Emp_Contact.lname AS lname
                            FROM          Emp_Contact
                            WHERE      Emp_Contact.emp_id = Performance_Review.reviewer_id) AS lname,
                          (SELECT     LEFT(Emp_Contact.name, 2) AS f_init
                            FROM          Emp_Contact
                            WHERE      Emp_Contact.emp_id = Performance_Review.reviewer_id) AS f_init
FROM         Performance_Review
	INNER JOIN                   REF_Review_Type ON Performance_Review.review_type_id = REF_Review_Type.review_type_id
WHERE     (Performance_Review.emp_id = #attributes.emp_id#)
</cfquery>
</cfsilent>
