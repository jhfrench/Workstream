
<!--Reports/qry_pto_accrual.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets calculates the PTO for Nucleus employees.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:34  stetzer
<>

Revision 1.7  2001-11-07 09:32:45-05  long
Added case for a user that is not in the standard accrual structure and has not been employed for the entire year.

Revision 1.6  2001-10-29 15:45:11-05  daugherty
Fixed wierd RCS merge issue.

Revision 1.5  2001-10-29 15:38:30-05  daugherty
OOPS

Revision 1.4  2001-10-15 16:51:52-04  long
<>

Revision 1.3  2001-10-15 15:30:29-04  long
Using session.workstream_company_select list instead of the hard code Company = 9

Revision 1.2  2001-10-15 12:15:58-04  long
Removed the hard coded project_id for the PTO hours and am now using the project_type_id to determine what codes are PTO.

Revision 1.1  2001-10-11 11:03:52-04  long
Added $log $ for edits to all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->
</cfsilent>
<cfquery name="PTO_hours" datasource="#application.datasources.main#">
select demographics.emp_id, emp_contact.name, emp_contact.lname,sum(isnull(time_entry.hours,0)) as 'PTO_Hours_Used',
/*<!-- this is when the person doesn't fall into the regular accrual structure, if they don't fit in, the field pto_type_indicator is filled wth the number of pto HOURS that they will accrue through the whole year. so take the hours in the pto_type_indicator field and divide by 12 to get the monthly accrual, and then multiply the monthly accrual by the number of months passed so far for the number of months tht the employee has ben accruing time this year, - 1 (because you don't get your hours for this month until the month is over. -->*/
isnull(case when pto_type_indicator > 0 then (CASE WHEN YEAR(HIRE_DATE) <> YEAR(GETDATE())  THEN pto_type_indicator /12 * (month(GETDATE()) - 1)ELSE pto_type_indicator /12 * (MONTH(GETDATE()) - month(tenure_date ))END)  else 
/*<!-- If you haven't had your anniversary this year yet or your anniversary is this month, take the number of months this year minus 1 as the multiplier, else take the month of your anniversary minus 1 as the multiplier --> */
(CASE WHEN MONTH(tenure_date) >= MONTH(GETDATE()) THEN month(GETDATE()) -1 else month(tenure_date) -1 end) *  
/*<!--- When you have had your anniversary this year already, then --->*/
ISNULL((CASE WHEN MONTH(tenure_date) < MONTH(GETDATE()) then
	/*<!--Get the rate that you accrue PTO hours and multiply them times 8(because there are 8 hours per work day and time is accrued in days off) The where statement gets the proper accrual rate for how long you have worked at the company. -->*/

	(select accrual_rate * 8
	from REF_pto_hours
	where (datediff(mm,demographics.tenure_date,
	cast(cast(month(tenure_date) as varchar(2)) + '/01/' + cast(year(GETDATE()) as varchar(4)) as smalldatetime)) )  
	between min_month and max_month )
/*<!-- If you have had your anniversary this year already... -->*/
else
	/*<!-- Get the rate that you accrued PTO hours for the part of the year before your anniversary and multiply them times 8(because there are 8 hours per work day and time is accrued in days off) -->*/
	(select accrual_rate * 8
	from REF_pto_hours
	where   (datediff(mm,demographics.tenure_date,GETDATE()) ) between min_month and max_month 
	       )
end),0) +
/*<!-- the folling case statements is to calculate the PTO hours you accrued this year AFTER your anniversary. If your anniversary is this month, then you haven't accrued any hours yet at your new rate so add 0 extra hours otherwise take the current month and subtract the month that you began your tenure. Multiply the result by.... -->*/ 
(CASE WHEN MONTH(tenure_date) >= MONTH(GETDATE()) THEN 0 else month(GETDATE())- month(tenure_date) end) *  
/*<!--- IF the MONTH of your hire is less than this month then go select your new accrual rate... in the sub query. --->*/
(CASE WHEN MONTH(tenure_date) < MONTH(GETDATE()) 
	then
	/*<!-- This selects the accrual rate times 8 
	(to account for the fact that the rate accrues in days and the timekeepiing system logs time in hours.) The difference between the month of your tenure date and this this month plus 1 (to account for not getting hours for this month) -->*/
	  (select accrual_rate * 8
  	  from REF_pto_hours
	  where (datediff(mm,demographics.tenure_date,GETDATE()) + 1) between min_month and max_month )
	else
	0
	/*<!-- otherwise you have accrued 0 hours at your new rate, then add the hours that you have rolled over from the previous year -->*/
	end) end + time_rollover_from_2000,0) as 'PTO_hours_earned' 

/*<!-- If you started work before the 15 of the month, you get credit  for working that month, otherwise it is as if you began working on the 1st of the next month, this is represented by "tenure_date" and is used to calculate all the PTO hours -->*/
FROM (select case when day(hire_date) > 15 then DATEADD(mm,1,hire_date) else hire_date end as tenure_date,*
from demographics where effective_to is null) as demographics inner join security on demographics.emp_id = security.emp_id
 
left Outer JOIN PTO_HOURS ON PTO_HOURS.emp_id = demographics.emp_id left outer JOIN time_entry ON demographics.emp_id = time_entry.emp_id 
											AND Project_id IN	(SELECT project_id
																FROM Project
																WHERE project_type_id = 1) 
AND year(time_entry.date) like year(GETDATE())
inner join company on demographics.emp_id = company.emp_id inner join emp_contact on demographics.emp_id = emp_contact.emp_id
WHERE security.disable <> 1 
AND company IN (#session.workstream_company_select_list#) <cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )> AND (Emp_Contact.Emp_ID IN (#PreserveSingleQuotes(attributes.form_Pin)#))</cfif>
<!--- <cfif individual>and demographics.emp_id=#emp_id#</cfif> --->

GROUP BY year(time_entry.date), project_id, name, lname, demographics.emp_id, demographics.tenure_date,demographics.hire_date,PTO_TYPE_INDICATOR, TIME_ROLLOVER_from_2000
ORDER BY year(time_entry.date), lname, name
</cfquery>
<!--- 		<cfif NOT listcontainsnoCase(attributes.form_Pin,"ALL" )> AND (Emp_Contact.Emp_ID IN (#PreserveSingleQuotes(attributes.form_Pin)#))</cfif> --->