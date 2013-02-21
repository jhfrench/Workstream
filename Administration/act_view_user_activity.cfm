<!-- Administration/act_view_user_activity.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="act_view_user_activity.cfm">
	<responsibilities>
		Help the user maintain navigation access.
	</responsibilities>
	<properties>
		<history email="jeromy_french@hotmail.com" author="Jeromy French" type="create" date="7/19/2010" role="FuseCoder" comments="Created File">
			$Id:$
			(JF | 7/19/10) Adding ability to view user's activity.

			(JF | 7/19/10) Making T-SQL compliant.
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
<cfparam name="attributes.limit_by_date_ind" default="1">
<cfparam name="attributes.end_date" default="#dateadd('d', 1, now())#">
<cfparam name="attributes.start_date" default="#dateadd('d', -61, attributes.end_date)#">


<!---retrieve user's name and username--->
<cfinclude template="../common_files/qry_get_user_information.cfm">

<!---retrieve attempted logins of user's username--->
<cfquery name="get_user_login_attempts" datasource="#application.datasources.main#">
SELECT Login_Attempt.created_date, Login_Attempt.success_ind, COALESCE(Link_User_Account_Status.active_ind,0) AS locked_ind
FROM User_Account
	INNER JOIN Login_Attempt ON UPPER(User_Account.user_name)=UPPER(Login_Attempt.user_name)
	LEFT OUTER JOIN Link_User_Account_Status ON User_Account.user_account_id=Link_User_Account_Status.user_account_id
		AND Login_Attempt.created_date BETWEEN Link_User_Account_Status.created_date-INTERVAL '12 hours' AND Link_User_Account_Status.created_date+INTERVAL '12 hours'
		AND Link_User_Account_Status.account_status_id=2 /*locked*/
WHERE User_Account.user_account_id=<cfqueryparam cfsqltype="cf_sql_integer" value="#attributes.user_account_id#"><cfif isdate(attributes.start_date) AND isdate(attributes.end_date)>
		AND Login_Attempt.created_date BETWEEN <cfqueryparam cfsqltype="cf_sql_date" value="#createodbcdate(attributes.start_date)#"> AND <cfqueryparam cfsqltype="cf_sql_date" value="#createodbcdate(attributes.end_date)#"></cfif>
ORDER BY Login_Attempt.login_attempt_id DESC
</cfquery>

<!---retrieve specified user's activity from the LOG_Page_Request table--->
<cfquery name="get_view_user_activity" datasource="#application.datasources.application_manager#">
SELECT LOG_Page_Request.page_request_id, COALESCE(REPLACE(LISTFIRST(LISTLAST(LOG_Page_Request.url_requested, '2'),'&'), 'fuseaction=', ''), LOG_Page_Request.url_requested) AS url_requested, LOG_Page_Request.page_load_time, 
	LOG_Page_Request.created_date AS request_date, pg_catalog.TIME(LOG_Page_Request.created_date) AS request_time, EXTRACT(HOUR FROM LOG_Page_Request.created_date) AS request_hour, 
	REF_Date.day_of_week_number, REF_Date.date_year, REF_Date.date_month, 
	EXTRACT(WEEK FROM REF_Date.odbc_date) AS date_week, REF_Date.date_day 
FROM LOG_Page_Request
	LEFT OUTER JOIN REF_Date ON CAST(LOG_Page_Request.created_date AS DATE)=CAST(REF_Date.odbc_date AS DATE)
WHERE LOG_Page_Request.user_identification=<cfqueryparam cfsqltype="cf_sql_varchar" value="#attributes.user_account_id#">
	AND LOG_Page_Request.url_requested LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%#cgi.server_name#%">
	AND LOG_Page_Request.url_requested NOT LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%view_help%"><cfif isdate(attributes.start_date) AND isdate(attributes.end_date)>
	AND LOG_Page_Request.created_date BETWEEN <cfqueryparam cfsqltype="cf_sql_date" value="#createodbcdate(attributes.start_date)#"> AND <cfqueryparam cfsqltype="cf_sql_date" value="#createodbcdate(attributes.end_date)#"></cfif>
ORDER BY LOG_Page_Request.page_request_id DESC
</cfquery>

<!---display favorite pages (other than log-in and log-out)--->
<cfquery name="get_favorite_pages" dbtype="query">
SELECT url_requested, COUNT(*) AS count1
FROM get_view_user_activity
WHERE url_requested NOT LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%login%">
	AND url_requested NOT LIKE <cfqueryparam cfsqltype="cf_sql_varchar" value="%logout%">
GROUP BY url_requested
ORDER BY count1 DESC
</cfquery>

<!---display favorite hours--->
<cfquery name="get_favorite_hours" dbtype="query">
SELECT request_hour, COUNT(*) AS count1
FROM get_view_user_activity
GROUP BY request_hour
ORDER BY count1 DESC
</cfquery>

<!---display count trend by week--->
<cfquery name="get_week_trend" dbtype="query">
SELECT date_year, date_week, COUNT(*) AS count1
FROM get_view_user_activity
GROUP BY date_year, date_week
ORDER BY date_year DESC, date_week DESC
</cfquery>

<!---display probable error incidents--->
<cfquery name="get_probable_errors" dbtype="query">
SELECT *
FROM get_view_user_activity
WHERE page_load_time IS NULL
ORDER BY page_request_id DESC
</cfquery>

<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="edit_navigation_access" fuseaction="Administration.edit_navigation_access" field_name="user_account_id" field2_name="program_year_id" field2_value="#session.program_year_id#" process_form_ind="1" method="Select">
<cfmodule template="../common_files/act_drilldown_form.cfm" function_name="administer_user_menu" fuseaction="Administration.administer_user_menu" field_name="user_account_id" field_value="">