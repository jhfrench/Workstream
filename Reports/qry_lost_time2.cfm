
<!-- Reports/qry_lost_time2.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Edits: 
	$Log$
	||
	Variables:

	END FUSEDOC --->

<cfquery name="lost_time" datasource="#application.datasources.main#">
SELECT Demographics.last_name||', '||Demographics.first_name AS full_name, 
	SUM(CASE WHEN project_id IN (709,724,879,910,941,972,1319,1352,1405,731,886,917,948,979,1326,1359,1412,706,723,878,909,940,971,1318,1351,1404,707,725,880,911,942,973,1320,1353,1406) THEN Time_Entry.hours else 0 end) AS PTO,
	SUM(CASE WHEN project_id IN (729,884,915,946,977,1324,1357,1410) THEN Time_Entry.hours else 0 end) AS bereavement,
	SUM(CASE WHEN project_id IN (708,726,881,912,943,974,1321,1354,1407) THEN Time_Entry.hours else 0 end) AS holiday,
	SUM(CASE WHEN project_id IN (730,885,916,947,978,1325,1358,1411) THEN Time_Entry.hours else 0 end) AS jury_duty,
	SUM(CASE WHEN project_id IN (728,883,914,945,976,1323,1356,1409) THEN Time_Entry.hours else 0 end) AS STD_LTD,
	SUM(CASE WHEN project_id IN (727,882,913,944,975,1322,1355,1408) THEN Time_Entry.hours else 0 end) AS Unpaid,
	SUM(CASE WHEN project_id IN (707,725,880,911,942,973,1320,1353,1406) THEN Time_Entry.hours else 0 end) AS Vacation,
	SUM(CASE WHEN project_id IN (709,724,879,910,941,972,1319,1352,1405,731,886,917,948,979,1326,1359,1412,729,884,915,946,977,1324,1357,1410,708,726,881,912,943,974,1321,1354,1407,730,885,916,947,978,1325,1358,1411,706,723,878,909,940,971,1318,1351,1404,728,883,914,945,976,1323,1356,1409,727,882,913,944,975,1322,1355,1408,707,725,880,911,942,973,1320,1353,1406) THEN Time_Entry.hours else 0 end) AS total
FROM Demographics
	LEFT OUTER JOIN Time_Entry ON Demographics.user_account_id=Time_Entry.user_account_id
		AND Time_Entry.date BETWEEN '#from_date#' AND '#to_date#'
	INNER JOIN Link_User_Account_Status ON Link_User_Account_Status.user_account_id=Demographics.user_account_id
		AND Link_User_Account_Status.active_ind=1
		AND Link_User_Account_Status.account_status_id=1 /*active*/
	INNER JOIN Link_Company_User_Account ON Demographics.user_account_id=Link_Company_User_Account.user_account_id
		AND Link_Company_User_Account.company_id IN (#session.workstream_selected_company_id#)<cfif NOT listcontainsnoCase(attributes.user_account_id,"ALL" )>
WHERE Demographics.user_account_id IN (#preservesinglequotes(attributes.user_account_id)#)</cfif>
GROUP BY Demographics.user_account_id, Demographics.last_name, Demographics.first_name
ORDER BY Demographics.last_name, Demographics.first_name
</cfquery>
</cfsilent>