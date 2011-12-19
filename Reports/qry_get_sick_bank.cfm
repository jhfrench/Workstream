
<!--Reports/qry_get_sick_bank.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I run the queries that show PTO-elligible employees in the drop-down selection.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.1  2005/03/09 18:13:33  stetzer
<>

	||
	END FUSEDOC --->
<cfquery name="get_sick_bank" datasource="#application.datasources.main#">
SELECT Emp_Contact.lname, Emp_Contact.name, ISNULL(Sick_Bank.granted_hours,0) AS granted_hours,
	ISNULL(Time_Taken.hours_used,0) AS hours_used, ISNULL(Sick_Bank.granted_hours,0)-ISNULL(Time_Taken.hours_used,0) AS hours_remaining
FROM Emp_Contact, Sick_Bank,
	(SELECT emp_id, SUM(hours) AS hours_used
	FROM Time_Entry
	WHERE project_id=1881
		AND emp_id IN (<cfif comparenocase(attributes.emp_id,"all")>#attributes.emp_id#<cfelse>#valuelist(get_pto_names.emp_id)#</cfif>)
	GROUP BY emp_id) AS Time_Taken
WHERE Emp_Contact.emp_id*=Sick_Bank.emp_id
	AND Emp_Contact.emp_id*=Time_Taken.emp_id
	AND Emp_Contact.emp_id IN (<cfif comparenocase(attributes.emp_id,"all")>#attributes.emp_id#<cfelse>#valuelist(get_pto_names.emp_id)#</cfif>)
ORDER BY Emp_Contact.lname, Emp_Contact.name
</cfquery>
</cfsilent>

