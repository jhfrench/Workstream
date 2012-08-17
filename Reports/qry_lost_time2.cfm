
<!-- reports/qry_lost_time2.cfm
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
SELECT [name]||' '||lname as full_name, 
	SUM(case when Project_id IN (709,724,879,910,941,972,1319,1352,1405,731,886,917,948,979,1326,1359,1412,706,723,878,909,940,971,1318,1351,1404,707,725,880,911,942,973,1320,1353,1406)then te.hours else 0 end) as PTO,
<!--- 	SUM(case when Project_id IN (731,886,917,948,979,1326,1359,1412)then te.hours else 0 end) as authorized_leave, --->
	SUM(case when Project_id IN (729,884,915,946,977,1324,1357,1410)then te.hours else 0 end) as bereavement,
	SUM(case when Project_id IN (708,726,881,912,943,974,1321,1354,1407)then te.hours else 0 end) as Holiday,
	SUM(case when Project_id IN (730,885,916,947,978,1325,1358,1411)then te.hours else 0 end) as jury_duty,
<!--- 	SUM(case when Project_id IN (706,723,878,909,940,971,1318,1351,1404)then te.hours else 0 end) as sick, --->
	SUM(case when Project_id IN (728,883,914,945,976,1323,1356,1409)then te.hours else 0 end) as STD_LTD,
	SUM(case when Project_id IN (727,882,913,944,975,1322,1355,1408)then te.hours else 0 end) as Unpaid,
	SUM(case when Project_id IN (707,725,880,911,942,973,1320,1353,1406)then te.hours else 0 end) as Vacation,
	SUM(case when Project_id IN (709,724,879,910,941,972,1319,1352,1405,731,886,917,948,979,1326,1359,1412,729,884,915,946,977,1324,1357,1410,708,726,881,912,943,974,1321,1354,1407,730,885,916,947,978,1325,1358,1411,706,723,878,909,940,971,1318,1351,1404,728,883,914,945,976,1323,1356,1409,727,882,913,944,975,1322,1355,1408,707,725,880,911,942,973,1320,1353,1406)then te.hours else 0 end) as total
FROM Emp_Contact, Time_Entry te, Security, Link_Company_Emp_Contact
WHERE 
	 te.date between '#from_date#' and '#TO_DATE#'
	AND (Link_Company_Emp_Contact.company_id IN (#session.workstream_selected_company_id#))
	AND Emp_Contact.emp_id *= te.emp_id 
	AND Emp_Contact.emp_id=Security.emp_id 
	AND Emp_Contact.emp_id=Link_Company_Emp_Contact.emp_id 
	<cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )> AND (Emp_Contact.emp_id IN (#preservesinglequotes(attributes.emp_id)#))</cfif>
	GROUP BY security.emp_id, [name], lname
	ORDER BY lname, name
</cfquery>
</cfsilent>
