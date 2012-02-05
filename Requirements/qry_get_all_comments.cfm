<!-- Comments/qry_get_all_comments.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_all_comments.cfm">
	<responsibilities>
		Query to get all comments for the application.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="5/29/2007" role="FuseCoder" comments="Created File">
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

<cfquery name="get_all_comments" datasource="#application.datasources.main#">
SELECT Comments.comments_id, Comments.comments_number, Comments.description AS comments,
	Comments.active_ind, REF_Module.description AS module, REF_Business_Function.description AS business_function,
	REF_Comments_Type.description AS comments_type, Link_Screen_Comments.l_s_c_id, REF_Business_Function.acronym
FROM Link_Screen_Comments
	INNER JOIN REF_Screen ON Link_Screen_Comments.screen_id=REF_Screen.screen_id
	INNER JOIN REF_Module ON REF_Screen.module_id=REF_Module.module_id
	INNER JOIN Comments ON Link_Screen_Comments.comments_id=Comments.comments_id
	INNER JOIN REF_Comments_Type ON Comments.comments_type_id=REF_Comments_Type.comments_type_id
	INNER JOIN REF_Business_Function ON REF_Screen.business_function_id=REF_Business_Function.business_function_id
	LEFT OUTER JOIN (
		SELECT User_Account.user_account_id, last_name+', '+first_name AS created_by
		FROM User_Account
			INNER JOIN Demographics ON User_Account.user_account_id=Demographics.user_account_id
		WHERE Demographics.active_ind=1
	) Created_By ON Created_By.user_account_id=Comments.created_by
WHERE Link_Screen_Comments.active_ind=1
	AND REF_Screen.active_ind=1
	AND REF_Module.active_ind=1
	AND Comments.active_ind=1
	AND REF_Comments_Type.active_ind=1
	AND REF_Business_Function.active_ind=1
ORDER BY REF_Comments_Type.sort_order, REF_Module.sort_order, REF_Business_Function.sort_order,
	Link_Screen_Comments.sort_order, Comments.comments_number
</cfquery>