
<!-- reports/qry_lost_time2.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 

	||
	Edits: 
	$Log$
	Revision 1.1  2005/03/09 18:14:02  stetzer
	<>

	Revision 1.2  2001-11-29 15:20:02-05  long
	added ORDER BY and "Vacation" hours to the PTO group

	Revision 1.1  2001-11-29 13:41:10-05  long
	rolled up vacation, authorized leave, and sick into pto

	Revision 1.0  2001-11-27 16:04:43-05  long
	Created the file

	||
	Variables:
	
	END FUSEDOC --->
	
<cfquery name="lost_time" datasource="#application.datasources.main#">
SELECT [name]+' '+lname as full_name, 
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
FROM Emp_Contact, Time_Entry te, Security, Company  
WHERE 
	 te.date between '#from_date#' and '#TO_DATE#'
	AND (company.company IN (#session.workstream_company_select_list#))
	AND Emp_Contact.Emp_ID *= te.Emp_ID 
	AND Emp_Contact.Emp_ID = Security.Emp_ID 
	AND Emp_Contact.Emp_ID = Company.Emp_ID 
	<cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )> AND (Emp_Contact.Emp_ID IN (#PreserveSingleQuotes(attributes.emp_id)#))</cfif>
	GROUP BY security.Emp_ID, [name], lname
	ORDER BY lname, name
</cfquery>
</cfsilent>
