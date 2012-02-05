<!-- Requirements/qry_get_screen_comments.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_get_screen_comments.cfm">
	<responsibilities>
		I retrieve comments for the page the user is viewing.
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

<cfquery name="get_screen_comments" datasource="#application.datasources.main#">
SELECT Comments.comments_id, Comments.comments_number, Comments.description AS comment_description,
	REF_Comments_Type.description AS comment_type, Created_By.created_by
FROM Link_Screen_Comments
	INNER JOIN REF_Screen ON Link_Screen_Comments.screen_id=REF_Screen.screen_id
	INNER JOIN Comments ON Link_Screen_Comments.comments_id=Comments.comments_id
	INNER JOIN REF_Comments_Type ON Comments.comments_type_id=REF_Comments_Type.comments_type_id
	LEFT OUTER JOIN (
		SELECT User_Account.user_account_id, last_name+', '+first_name AS created_by
		FROM User_Account
			INNER JOIN Demographics ON User_Account.user_account_id=Demographics.user_account_id
		WHERE Demographics.active_ind=1
	) Created_By ON Created_By.user_account_id=Comments.created_by
WHERE Link_Screen_Comments.active_ind=1
	AND REF_Screen.active_ind=1
	AND Comments.active_ind=1
	AND REF_Comments_Type.active_ind=1
	AND (1=0 /*this is here just for SQL syntax purposes*/<cfif NOT session.hide_general_requirements>
		/*get requirements that apply to all screens, regardless of module*/
		OR fuseaction LIKE 'All.%'</cfif><cfif NOT session.hide_module_all>
		/*get requirements that apply to all screens for a specific module*/
		OR fuseaction='#listfirst(attributes.fuseaction,".")#.all'</cfif>
		/*get requirements that apply to the specifc screen*/
		OR fuseaction='#attributes.fuseaction#')
ORDER BY REF_Comments_Type.sort_order, Comments.comments_number
</cfquery>