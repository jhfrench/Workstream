
<!--Reports/qry_pto_accrual.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that gets calculates the PTO for Nucleus employees.

	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
</cfsilent>
<cfquery name="PTO_hours" datasource="#application.datasources.main#">
SELECT demographics.emp_id, emp_contact.name, emp_contact.lname,
	SUM(COALESCE(time_entry.hours,0)) AS 'PTO_Hours_Used',
/*<!-- this is when the person doesn't fall into the regular accrual structure, if they don't fit in, the field pto_type_indicator is filled wth the number of pto HOURS that they will accrue through the whole year. so take the hours in the pto_type_indicator field and divide by 12 to get the monthly accrual, and then multiply the monthly accrual by the number of months passed so far for the number of months tht the employee has ben accruing time this year, - 1 (because you don't get your hours for this month until the month is over. -->*/
	COALESCE(CASE WHEN pto_type_indicator > 0 THEN (CASE WHEN EXTRACT(YEAR FROM HIRE_DATE) <> EXTRACT(YEAR FROM CURRENT_TIMESTAMP)  THEN pto_type_indicator /12 * (EXTRACT(MONTH FROM CURRENT_TIMESTAMP) - 1)ELSE pto_type_indicator /12 * (EXTRACT(MONTH FROM CURRENT_TIMESTAMP) - month(tenure_date ))END)  else 
/*<!-- If you haven't had your anniversary this year yet or your anniversary is this month, take the number of months this year minus 1 as the multiplier, else take the month of your anniversary minus 1 as the multiplier --> */
(CASE WHEN EXTRACT(MONTH FROM tenure_date) >= EXTRACT(MONTH FROM CURRENT_TIMESTAMP) THEN EXTRACT(MONTH FROM CURRENT_TIMESTAMP) -1 else month(tenure_date) -1 end) *
/*<!--- When you have had your anniversary this year already, then --->*/
COALESCE((CASE WHEN EXTRACT(MONTH FROM tenure_date) < EXTRACT(MONTH FROM CURRENT_TIMESTAMP) then
	/*<!--Get the rate that you accrue PTO hours and multiply them times 8(because there are 8 hours per work day and time is accrued in days off) The where statement gets the proper accrual rate for how long you have worked at the company. -->*/

	(select accrual_rate * 8
	from REF_pto_hours
	where (DATEDIFF(mm,demographics.tenure_date,
	cast(cast(month(tenure_date) AS varchar(2)) || '/01/' || CAST(EXTRACT(YEAR FROM CURRENT_TIMESTAMP) AS varchar(4)) as smalldatetime)) )
	between min_month and max_month )
/*<!-- If you have had your anniversary this year already... -->*/
else
	/*<!-- Get the rate that you accrued PTO hours for the part of the year before your anniversary and multiply them times 8(because there are 8 hours per work day and time is accrued in days off) -->*/
	(select accrual_rate * 8
	from REF_pto_hours
	where   (DATEDIFF(mm,demographics.tenure_date,CURRENT_TIMESTAMP) ) between min_month and max_month 
		  )
end),0) +
/*<!-- the folling case statements is to calculate the PTO hours you accrued this year AFTER your anniversary. If your anniversary is this month, then you haven't accrued any hours yet at your new rate so add 0 extra hours otherwise take the current month and subtract the month that you began your tenure. Multiply the result by.... -->*/ 
(CASE WHEN EXTRACT(MONTH FROM tenure_date) >= EXTRACT(MONTH FROM CURRENT_TIMESTAMP) THEN 0 else EXTRACT(MONTH FROM CURRENT_TIMESTAMP)- month(tenure_date) end) *
/*<!--- IF the MONTH of your hire is less than this month then go select your new accrual rate... in the sub query. --->*/
(CASE WHEN EXTRACT(MONTH FROM tenure_date) < EXTRACT(MONTH FROM CURRENT_TIMESTAMP) 
	then
	/*<!-- This selects the accrual rate times 8 
	(to account for the fact that the rate accrues in days and the timekeepiing system logs time in hours.) The difference between the month of your tenure date and this this month plus 1 (to account for not getting hours for this month) -->*/
	  (select accrual_rate * 8
  	  from REF_pto_hours
	  where (DATEDIFF(mm,demographics.tenure_date,CURRENT_TIMESTAMP) + 1) between min_month and max_month )
	else
	0
	/*<!-- otherwise you have accrued 0 hours at your new rate, then add the hours that you have rolled over from the previous year -->*/
	END) END + time_rollover_from_2000,0) as 'PTO_hours_earned' 

/*<!-- If you started work before the 15 of the month, you get credit  for working that month, otherwise it is as if you began working on the 1st of the next month, this is represented by "tenure_date" and is used to calculate all the PTO hours -->*/
FROM (select case when EXTRACT(DAY FROM hire_date) > 15 then DATEADD(mm,1,hire_date) else hire_date end as tenure_date,*
from demographics where effective_to IS NULL) as demographics inner join security on demographics.emp_id = security.emp_id
 
left Outer JOIN PTO_HOURS ON PTO_HOURS.emp_id = demographics.emp_id left outer JOIN time_entry ON demographics.emp_id = time_entry.emp_id 
											AND Project_id IN	(SELECT project_id
																FROM Project
																WHERE project_type_id = 1) 
AND EXTRACT(YEAR FROM Time_Entry.work_date) like EXTRACT(YEAR FROM CURRENT_TIMESTAMP)
inner join Link_Company_Emp_Contact on demographics.emp_id = Link_Company_Emp_Contact.emp_id
inner join emp_contact on demographics.emp_id = emp_contact.emp_id
WHERE Time_Entry.active_ind=1
	AND security.disable <> 1 
AND company_id IN (#session.workstream_selected_company_id#) <cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )> AND (Emp_Contact.emp_id IN (#preservesinglequotes(attributes.emp_id)#))</cfif>
<!--- <cfif individual>and demographics.emp_id=#emp_id#</cfif> --->

GROUP BY EXTRACT(YEAR FROM Time_Entry.work_date), project_id, name, lname, demographics.emp_id, demographics.tenure_date,demographics.hire_date,PTO_TYPE_INDICATOR, TIME_ROLLOVER_from_2000
ORDER BY EXTRACT(YEAR FROM Time_Entry.work_date), lname, name
</cfquery>
<!--- 		<cfif NOT listcontainsnoCase(attributes.emp_id,"ALL" )> AND (Emp_Contact.emp_id IN (#preservesinglequotes(attributes.emp_id)#))</cfif> --->