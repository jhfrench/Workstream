
<!--reports/qry_overtime_hours.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the query that retreives the sum of the hours and the codes that the overtime people have spent their time on.

	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:14:29  stetzer
<>

Revision 1.1  2001-10-11 11:03:52-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfquery name="indiv_codes" datasource="#application.datasources.main#">
SELECT SUM(Time_Entry.Hours) AS hours, 
    Project.Description
FROM Time_Entry INNER JOIN
    Project ON Time_Entry.Project_id = Project.project_id
WHERE ((Time_entry.date>='#start_date#') AND 
    (Time_entry.date<='#end_Date#'))  AND (time_entry.emp_id=#pin#) 
GROUP BY Project.Description
</cfquery>
</cfsilent>

